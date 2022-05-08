#' @title Create a single mlr3 benchmark run including tuning
#' @description Creates an mlr3 learner which performs hyperparameter tuning in nested resampling
create_single_bm = function(learner,
  learner_id,
  task,
  measure,
  resampling_inner,
  resampling_outer,
  search_space,
  term_evals,
  method) {
  learner = lrn(learner)
  learner$id = learner_id

  # tuning
  at = auto_tuner(
    learner = learner,
    resampling = resampling_inner,
    measure = msr("classif.ce"), # hard coded in this example
    search_space = search_space,
    term_evals = term_evals,
    method = method
  )

  resampling_outer = resampling_outer

  design = benchmark_grid(
    tasks = tsk(task), learners = list(at),
    resamplings = resampling_outer
  )
  bm = benchmark(design)
  return(bm)
}
