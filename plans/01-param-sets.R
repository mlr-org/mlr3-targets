"01_param_set" <- list(
  tar_target(
    param_set_svm1,
    ParamSet$new(params = list(
      ParamFct$new("type", "C-classification"),
      ParamFct$new("kernel", "radial"),
      ParamDbl$new("cost", lower = 0, upper = 100),
      ParamDbl$new("gamma", lower = 0, upper = 100)
    ))
  ),
  tar_target(param_set_svm2, {
    foo <- ParamSet$new(params = list(
      ParamFct$new("type", "C-classification"),
      ParamFct$new("kernel", "radial"),
      ParamDbl$new("cost", lower = -5, upper = 5),
      ParamDbl$new("gamma", lower = -5, upper = 3)
    ))

    foo$trafo <- function(x, param_set) {
      x$cost <- 2^x$cost
      x$gamma <- 2^x$gamma
      return(x)
    }
    return(foo)
  }),
  tar_target(param_set_knn1, {
    ParamSet$new(params = list(
      ParamInt$new("k", lower = 1, upper = 50),
      ParamDbl$new("distance", lower = 1, upper = 50)
    ))
  }),
  tar_target(param_set_knn2, {
    ParamSet$new(params = list(
      ParamInt$new("k", lower = 1, upper = 30)
    ))
  })
)

# search_space_list <- list(
#   param_set_svm1,
#   param_set_svm2,
#   param_set_knn1,
#   param_set_knn2
# )
