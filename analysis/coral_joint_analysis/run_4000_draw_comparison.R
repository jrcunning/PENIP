# Run from the PENIP project root. A matching saved fit is always reused.
# Authorized convergence run: four chains, 1000 warmup +1000 sampling each,
# five threads/chain. Model, data, priors and prediction conventions unchanged.
Sys.setenv(
  RSTUDIO_PANDOC = "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools",
  OPENBLAS_NUM_THREADS = "1", OMP_NUM_THREADS = "1", VECLIB_MAXIMUM_THREADS = "1"
)
rmarkdown::render(
  "analysis/coral_joint_analysis/coral_joint_brms_analysis.Rmd",
  output_dir = "outputs/coral_joint_analysis/brms_2024_4000draws",
  knit_root_dir = getwd(),
  params = list(
    output_directory = "outputs/coral_joint_analysis/brms_2024_4000draws",
    allow_new_fit = FALSE, regional_distributional_effects = FALSE,
    prior_version = "revised",
    chains = 4L, warmup = 1000L, sampling = 1000L,
    threads_per_chain = 5L, adapt_delta = 0.95,
    max_treedepth = 11L, seed = 20261026L
  ),
  envir = new.env(parent = globalenv()), quiet = FALSE
)
