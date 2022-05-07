"03_learners" <- list(
  tar_target(learner_names, c(
    "classif.svm",
    "classif.kknn"
  )),
  tar_target(learners,
    lrn(learner_names),
    pattern = map(learner_names)
  )
)
