library(reticulate)
conda <- ifelse(file.exists("/opt/conda/bin/conda"), "/opt/conda/bin/conda", "/data/home-ext/miniconda3/bin/conda")
use_condaenv("man_ccia", conda = conda, required = TRUE)
if (interactive()) {
  message("Running interactively. Starting REPL.")
  repl_python()
}
