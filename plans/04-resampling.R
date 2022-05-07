"04_resampling" <- list(
  tar_target(
    resamplings,
    list(resampling_inner, resampling_outer)
  ),
  tar_target(resampling_inner, {
    rsmp("cv", folds = 5)
  }),
  tar_target(resampling_outer, {
    rsmp("repeated_cv", folds = 2, repeats = 1)
  })
)
