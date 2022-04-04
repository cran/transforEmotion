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
#  # Example text
#  text <- neo_ipip_extraversion$friendliness[1:5] # positively worded items only
#  
#  # Run transformer function
#  transformer_scores(
#      text = text,
#      classes = c(
#        "friendly", "gregarious", "assertive",
#        "active", "excitement", "cheerful"
#      )
#  )

## ----transformers_scores_output, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  $`make friends easily`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.579      0.075      0.070      0.071      0.050      0.155
#  
#  $`warm up quickly to others`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.151      0.063      0.232      0.242      0.152      0.160
#  
#  $`feel comfortable around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.726      0.044      0.053      0.042      0.020      0.115
#  
#  $`act comfortably around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.524      0.062      0.109      0.183      0.019      0.103
#  
#  $`cheer people up`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.071      0.131      0.156      0.190      0.362      0.089

## ----nlp_scores, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  # Run NLP function
#  nlp_scores(
#      text = text,
#      classes = c(
#        "friendly", "gregarious", "assertive",
#        "active", "excitement", "cheerful"
#      ),
#      semantic_space = "cbow"
#  )

## ----nlp_scores_output, eval = FALSE, echo = TRUE, comment = NA, warning = FALSE, message = FALSE----
#  $`make friends easily`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.192      0.279      0.151      0.036      0.081      0.089
#  
#  $`warm quickly others`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.126      0.276      0.072      0.150      0.141      0.176
#  
#  $`feel comfortable around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.222      0.353      0.247      0.117      0.214      0.133
#  
#  $`act comfortably around people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.198      0.365      0.157      0.092      0.183      0.122
#  
#  $`cheer people`
#    friendly gregarious  assertive     active excitement   cheerful
#       0.225      0.229      0.168      0.034      0.204      0.279

