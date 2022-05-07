"06_benchmark" <- list(
  tar_target(benchmark_grid, tibble::tribble(

    # write learner/ParamSet grid
    ~learner, ~learner_id,
    "classif.svm", "SVM-PS1",
    "classif.svm", "SVM-PS2",
    "classif.kknn", "KNN-PS1",
    "classif.kknn", "KNN-PS2"
  ) %>%
    dplyr::mutate(search_space = list(
      param_set_svm1,
      param_set_svm2,
      param_set_knn1,
      param_set_knn2
    )) %>%
    tidyr::crossing(task = c("iris", "spam"))),
  tar_target(bm,
    create_single_bm(
      learner = benchmark_grid$learner,
      learner_id = benchmark_grid$learner_id,
      task = benchmark_grid$task,
      measure = measure,
      search_space = benchmark_grid$search_space[[1]],
      resampling_inner = resampling_inner,
      resampling_outer = resampling_outer,
      terminator = terminator
    ),
    pattern = map(benchmark_grid),
    iteration = "list"
  ),

  # combine single benchmark results (all)
  tar_target(
    bm_agg,
    do.call(c, bm)
  )
)
