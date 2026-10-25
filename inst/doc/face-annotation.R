## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(transforEmotion)
# clip <- system.file("extdata", "two-people.mp4", package = "transforEmotion")
# faces <- detect_faces(clip, nframes = 20)
# table(faces$track_id, faces$person_id)

## -----------------------------------------------------------------------------
# view_faces(faces)

## -----------------------------------------------------------------------------
# chosen <- view_faces(faces, select = TRUE)
# scores <- face_scores(chosen, classes = c("happy", "sad", "angry", "neutral"))

## -----------------------------------------------------------------------------
# emotions <- c("happy", "sad", "angry", "neutral")
# task <- annotation_task(
#   faces, classes = emotions,
#   questions = annotation_questions(c("face_check", "emotion", "intensity")),
#   coders = c("C01", "C02"), overlap = 1,
#   dir = "faces-round-1"
# )

## -----------------------------------------------------------------------------
# coding <- annotate_faces(task, coder = "C01")

## -----------------------------------------------------------------------------
# annotation_progress(task)
# coding$stop()

## -----------------------------------------------------------------------------
# answers <- read_annotations(task, "te-annotations:eyJzY2hlbWEiOi...")

## -----------------------------------------------------------------------------
# ann <- read_annotations(task)
# annotation_agreement(ann)

## -----------------------------------------------------------------------------
# truth <- consensus_labels(ann, "emotion")
# truth <- truth[!is.na(truth$label), ]
# 
# scores <- face_scores(faces, classes = emotions)
# both <- merge(truth, scores, by = c("source", "frame_index", "face"))
# both$pred <- emotions[max.col(both[emotions])]
# evaluate_emotions(both, id_col = "item_id", truth_col = "label", pred_col = "pred",
#                   probs_cols = emotions, classes = emotions)

## -----------------------------------------------------------------------------
# emotions <- c("angry", "fearful", "happy", "sad")
# items <- data.frame(id = errors$clip, media = errors$path, text = errors$description,
#                     label = errors$label, prediction = errors$predicted, errors[, emotions])
# review <- annotation_task(items = items, classes = emotions, coders = c("C01", "C02"),
#                           dir = "error-review")
# annotate_faces(review, coder = "C01")

## -----------------------------------------------------------------------------
# answers <- read_annotations(review)
# table(answers$value[answers$question == "why"])
# 
# # The coders' label for each clip, against the dataset's label and against the model
# consensus <- consensus_labels(answers)
# evaluate_emotions(consensus, truth_col = "reference", pred_col = "label")
# evaluate_emotions(consensus, truth_col = "label", pred_col = "prediction")

