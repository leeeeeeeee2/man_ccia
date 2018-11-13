library(zoo)
library(dplyr)

aggregate_with_missing <- function(datain, na_days = 0.2, na_months = 1.6) {

  # First do monthly
  tests <- datain %>% group_by(Yearmon = as.yearmon(Date)) %>%
    summarize(TMax_Missing = (sum(is.na(MaxTemp))/sum(is.na(MaxTemp), !is.na(MaxTemp))),
              TMin_Missing = (sum(is.na(MinTemp))/sum(is.na(MinTemp), !is.na(MinTemp))),
              TMean_Missing = (sum(is.na(MeanTemp))/sum(is.na(MeanTemp), !is.na(MeanTemp))))

  # Take note of those months that are missing more than 20% of the data
  badrows_max <- which(tests$TMax_Missing > na_days)
  badrows_min <- which(tests$TMin_Missing > na_days)
  badrows_mean <- which(tests$TMean_Missing > na_days)

  # Then do annual
  dat <- datain %>%
    group_by(Year = format(Date, format = "%Y"), Month = format(Date, format = "%m")) %>%
    summarize_all(mean, na.rm = TRUE)

  dat$MaxTemp[badrows_max] <- NA
  dat$MinTemp[badrows_min] <- NA
  dat$MeanTemp[badrows_mean] <- NA

  tests <- dat %>% group_by(Year) %>%
    summarize(TMax_Missing = (sum(is.na(MaxTemp))/sum(is.na(MaxTemp), !is.na(MaxTemp))),
              TMin_Missing = (sum(is.na(MinTemp))/sum(is.na(MinTemp), !is.na(MinTemp))),
              TMean_Missing = (sum(is.na(MeanTemp))/sum(is.na(MeanTemp), !is.na(MeanTemp))))

  badrows_max <- which(tests$TMax_Missing > na_months)
  badrows_min <- which(tests$TMin_Missing > na_months)
  badrows_mean <- which(tests$TMean_Missing > na_months)

  dat <- dat %>% group_by(Year) %>% summarize_all(mean) %>% select(Year, MaxTemp, MinTemp, MeanTemp)
  dat$MaxTemp[badrows_max] <- NA
  dat$MinTemp[badrows_min] <- NA
  dat$MeanTemp[badrows_mean] <- NA
  dat
}
