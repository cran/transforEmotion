## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ----load, eval = TRUE, echo = FALSE, comment = NA, warning = FALSE, message = FALSE----
library(transforEmotion)

## ----python_install, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  print("Is Python installed?")
#  reticulate::py_available(TRUE)

## ----python_install_eval, eval = TRUE, echo = FALSE, comment = NA, warning = FALSE, message = FALSE----
print("Is Python installed?")
reticulate::py_available(TRUE)

## ----python_location, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  print("Where is Python installed?")
#  reticulate::py_config()

## ----python_location_eval, eval = TRUE, echo = FALSE, comment = NA, warning = FALSE, message = FALSE----
print("Where is Python installed?")
reticulate::py_config()

## ----python_setup, eval = TRUE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
python_setup()

## ----transformers_install, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  print("'transformers' module installed?")
#  reticulate::py_module_available("transformers")

## ----transformers_install_eval, eval = TRUE, echo = FALSE, comment = NA, warning = FALSE, message = FALSE----
print("'transformers' module installed?")
TRUE

## ----transformers_scores, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  # Load data
#  data(neo_ipip_extraversion)
#  
#  # Run transformer function
#  transformer_scores(
#      text = neo_ipip_extraversion$friendliness[1:5], # positively worded items only
#      classes = c(
#        "friendly", "gregarious", "assertive",
#        "active", "excitement", "cheerful"
#      ),
#      multiple_classes = FALSE,
#      keep_in_env = TRUE
#  )

## ----transformers_scores_output, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  $`Make friends easily`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.297      0.518      0.031      0.113      0.007      0.034
#  
#  $`Warm up quickly to others`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.457      0.196      0.044      0.206      0.033      0.064
#  
#  $`Feel comfortable around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.244      0.465      0.027      0.206      0.015      0.042
#  
#  $`Act comfortably around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.269      0.359      0.037      0.303      0.003      0.029
#  
#  $`Cheer people up`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.302      0.176      0.035      0.060      0.090      0.335

