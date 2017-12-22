library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

data_df <- tbl_df(data)

data_df$Date <- dmy(data_df$Date)

two_days_data <- filter(data_df, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))

write.table(two_days_data, file = "two_days_of_household_power_consumption.txt", sep = ";", na = "?", row.names = FALSE)