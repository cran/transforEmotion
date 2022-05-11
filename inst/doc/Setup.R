## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ----load, eval = TRUE, echo = FALSE, comment = NA, warning = FALSE, message = FALSE----
library(transforEmotion)

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

