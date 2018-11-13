avg_baseline <- function(datin) {
  dat_proj <- filter(datin, !grepl("historical", Scenario))
  dat_hist <- filter(datin, grepl("historical", Scenario))

  dat_out <- dat_hist %>% dplyr::select(-Scenario) %>% group_by(Variable, Model, Ensemble) %>% summarize_all(mean) %>% ungroup()

  dat_hist <- add_column(dat_hist, Scenarios = str_match_all(dat_hist$Scenario, "rcp[024568]{2}"))

  if (sum(lengths(dat_hist$Scenarios)) > 0) {
    dat_out <- dat_out %>% add_column(Notes = rep(as.character(NA), nrow(dat_out)))
    for (row in 1:nrow(dat_out)) {
      if (length(dat_hist$Scenarios[which(dat_hist$Model == dat_out$Model[row] & dat_hist$Ensemble == dat_out$Ensemble[row])]) > 1) {
        dat_out$Notes[row] <- paste("Baseline partially forced by", paste(dat_hist$Scenarios[which(dat_hist$Model == dat_out$Model[row] & dat_hist$Ensemble == dat_out$Ensemble[row])], collapse = ", "))
      }
    }
    dat_out <- dat_out %>% add_column(Scenario = rep("historical", nrow(dat_out)), .after = "Model")
    dat_proj <- dat_proj %>% add_column(Notes = rep(as.character(NA), nrow(dat_proj)))

    return(bind_rows(dat_out, dat_proj) %>% arrange(Ensemble, Model, Scenario))
  } else {
    return(datin)
  }
}
