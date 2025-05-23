import os
os.environ["TOKENIZERS_PARALLELISM"] = "false"
import math
import cv2
import numpy as np
import pandas as pd
from pytubefix import YouTube #19 Fixed pytube issue
from transformers import CLIPProcessor, CLIPModel
from image import classify_image
import torch.nn.functional as F
import time


def yt_analyze(url, nframes, labels, side='largest', start=0, end=-1, uniform=False,
               ff=10, frame_dir='temp/', video_name='temp', model_name='oai-base', local_model_path=None):
  nframes = int(nframes)
  start_time = time.time()
  temp_dir =  frame_dir
  k = 0
  video = None
  detected_emotions = []
  if end == -1 and start == 0:
    cut = False
  else:
    if end <= start:
      raise ValueError("End time must be greater than start time.")
    if end < 0 or start < 0:
      raise ValueError("Start and end times must be positive.")
    cut = True
  if "youtu" in url:
    yt = YouTube(url)
    ######### YT processing
    while k < 3: # make three attempts to retrieve YouTube video stream
      try:
        video = yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first()
        break
      except:
        print("Error occurred while getting video stream. Retrying ... ")
        k += 1
    if k==3:
      raise ValueError("Failed to get video stream after 3 attempts.")
    else:
      video_path = os.path.join(temp_dir, video_name + ".mp4")
      print(f"Downloading video to {video_path}")
      k = 0
      while k < 3:
        try:
          video.download(output_path=frame_dir, filename="%s.mp4" %video_name)
          break
        except:
          print("Error occurred while downloading video. Retrying...")
          k += 1
      if k==3:
        raise ValueError("Failed to download video after 3 attempts.")
      ################# end of YT processing
  else:
    video_path = os.path.join(url)
  cap = cv2.VideoCapture(video_path)
  if not cut:
    num_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    if uniform:
      frame_interval = math.ceil(num_frames / nframes)
    else:
      frame_interval = ff
    if ff*nframes > num_frames:
      raise ValueError("Video is too short for requested number of frames.")
    counter = 0
    print(f"Extracting {nframes} frames from {num_frames} total frames")
    for i in range(nframes):
        frame_index = i * frame_interval
        cap.set(cv2.CAP_PROP_POS_FRAMES, frame_index)
        ret, frame = cap.read()
        if not ret:
          print(f"Error reading frame {i}")
          continue
        image_path = os.path.join(frame_dir, f"{video_name}-frame-{i}.jpg")
        cv2.imwrite(image_path, frame)
        counter += 1
  else:
    start_frame = int(start * cap.get(cv2.CAP_PROP_FPS))
    end_frame = int(end * cap.get(cv2.CAP_PROP_FPS))
    print("Cutting video to designated time interval...")
    num_frames = end_frame - start_frame
    if num_frames < nframes:
      frame_interval = 1
    else:
      if uniform:
        frame_interval = math.ceil(num_frames / nframes)
      else:
        frame_interval = ff
    print(f"Extracting {nframes} frames from {num_frames} total frames")
    counter = 0
    for i in range(min(nframes, num_frames)):
        frame_index = start_frame + i * frame_interval
        cap.set(cv2.CAP_PROP_POS_FRAMES, frame_index)
        ret, frame = cap.read()
        if not ret:
          print(f"Error reading frame {i}")
          continue
        image_path = os.path.join(frame_dir, f"{video_name}-frame-{i}.jpg")
        cv2.imwrite(image_path, frame)
        counter += 1
  print(f"Total number of saved frames: {counter}")

  for i in range(counter):
    image = os.path.join(frame_dir, f"{video_name}-frame-{i}.jpg")
    if not(image is None):
      emotions = classify_image(image, labels, face=side, model_name=model_name, local_model_path=local_model_path)
      if emotions:
        # Add the dictionary directly to our list
        detected_emotions.append(emotions)
      else:
        # Create a dictionary with NaN values for each emotion
        detected_emotions.append({label: np.nan for label in labels})
    else:
      # Create a dictionary with NaN values for each emotion
      detected_emotions.append({label: np.nan for label in labels})
  
  # Convert list of dictionaries to DataFrame - no need to set columns manually
  df = pd.DataFrame(detected_emotions)
  end_time = time.time()
  print(f"Done! Execution time: {end_time - start_time} seconds")
  return df
