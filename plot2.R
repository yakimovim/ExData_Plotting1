library(dplyr)
library(lubridate)

power_consumption <- read.table("two_days_of_household_power_consumption.txt", 
                                header = TRUE, 
                                sep = ";", 
                                na.strings = "?")

power_consumption <- tbl_df(power_consumption) %>%
  mutate(Moment = ymd_hms(paste(Date, Time)))

with(power_consumption, {
  plot(Moment, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(Moment, Global_active_power)
})

dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()