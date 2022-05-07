# mlr3-targets

<!-- badges: start -->
![fixed](https://github.com/mlr-org/mlr3-targets/workflows/fixed/badge.svg)
![latest](https://github.com/mlr-org/mlr3-targets/workflows/latest/badge.svg)
<!-- badges: end -->

The goal of mlr3-targets is to show how to use the [mlr3](https://github.com/mlr-org/mlr3) machine-learning framework in combination with the workflow package [targets](https://github.com/ropensci/targets).

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

- Using `R.utils::sourceDirectory()` instead of a for-loop to source multiple scripts/directories makes `_targets.R` a bit cleaner with a minimal increase WRT to dependencies
- Putting targets into `plans/` (instead of all into `_targets.R`) and splitting them up across multiple R scripts allows for a meta-level organization of targets.
  Including the scripts individually in `_targets.R` allows to quickly comment out certain ones (which might relate to a standalone project part). 
  This seems easier than searching for specific target which would avoid other project parts to be run
- Each "plan" is visible in the global environment including the individual target count
