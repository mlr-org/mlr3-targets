# Load packages ---------------------------------------------------------------#
library(targets)
source("packages.R")

# Set target options ----------------------------------------------------------#
tar_option_set(
  format = "qs" # see ?tar_target
)

# Source R functions-----------------------------------------------------------#
R.utils::sourceDirectory("R")

# Set mlr3 options ------------------------------------------------------------#
# set mlr3 options globally: suppress progress output of `benchmark()`
# lgr::get_logger("mlr3")$set_threshold("warn") # nolint
options(clustermq.scheduler = "multicore") # for `tar_make_clustermq()`

# Define plans ----------------------------------------------------------------#
R.utils::sourceDirectory("plans")

list(
  `01_param_set`,
  `02_measures`,
  `03_learners`,
  `04_resampling`,
  `05_tuning`,
  `06_benchmark`

)
