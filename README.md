# mlr3-targets

<!-- badges: start -->
![renv-fixed](https://github.com/mlr-org/mlr3-targets/workflows/renv-fixed/badge.svg)
![renv-latest](https://github.com/mlr-org/mlr3-targets/workflows/renv-latest/badge.svg)
<!-- badges: end -->

The goal of `mlr3-targets` is to show how to use the [mlr3](https://github.com/mlr-org/mlr3) machine-learning framework in combination with the workflow package [targets](https://github.com/ropensci/targets).

This example project showcases a benchmark of different learners (SVM, KKNN, RF), including hyperparameter tuning, across the `iris` and `spam` datasets.

The project shows examples of 

- dynamic branching in targets
- creation of custom functions
- using multiple "plans" to organize the project
- the use of {renv} for package version control


## Usage

To clone this repo, execute the following 

```r
usethis::use_course("mlr-org/mlr3-targets")
```

To install a **fixed snapshot** of the required R packages call

```r
renv::restore()
```

To install the **latest** versions of the required R packages call

```r
renv::hydrate()
```

After a successful installation of all dependencies call `

```
tar_make()
```

to run the complete project.
Alternative, use `tar_make_clustermq()` to run in parallel.

- This will build all R objects of the project (or "targets" in target's DSL) in the correct order.
- You can visualize the project dependency structure via `tar_visnetwork()`.
- To load specific R objects into the global environment, call `tar_load(<object name>)`.

See the [targets manual](https://books.ropensci.org/targets/) for more information on {targets}.

## Other targets learning resources

- [Talks](https://github.com/ropensci/targets#recorded-talks)
- [targets-examples](https://github.com/ropensci/targets#example-projects)
- [targets](https://github.com/ropensci/targets)

## Acknowledgements

- [Will Landau](https://github.com/wlandau) for developing and maintaining {targets} in an awesome way
- [The mlr3 team](https://github.com/mlr-org/mlr3) for developing the {mlr3} package framework

## Custom structure justification

This project uses a custom, personal structure for targets-based projects.
The following bullet points outline the thoughts behind this structure.

- Using `R.utils::sourceDirectory()` instead of a for-loop to source multiple scripts/directories makes `_targets.R` a bit cleaner with a minimal increase WRT to dependencies
- Putting targets into `plans/` (instead of all into `_targets.R`) and splitting them up across multiple R scripts allows for a meta-level organization of targets.
  Including the scripts individually in `_targets.R` allows to quickly comment out certain ones (which might relate to a standalone project part). 
  This seems easier than searching for specific target which would avoid other project parts to be run
- Each "plan" is visible in the global environment including the individual target count
- The decision to place the list of required packages in `packages.R` instead of `_targets.R` is for the simple reason that the name of `packages.R` is very descriptive. 
  When a new package is required, I just think "packages" in my head and grep for `packages.R` to add a new package.
