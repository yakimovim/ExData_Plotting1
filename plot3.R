library(dplyr)
library(lubridate)

power_consumption <- read.table("two_days_of_household_power_consumption.txt", 
                                header = TRUE, 
                                sep = ";", 
                                na.strings = "?")

power_consumption <- tbl_df(power_consumption) %>%
  mutate(Moment = ymd_hms(paste(Date, Time)))

with(power_consumption, {
  plot(Moment, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(Moment, Sub_metering_1, col = "black")
  lines(Moment, Sub_metering_2, col = "red")
  lines(Moment, Sub_metering_3, col = "blue")
  legend("topright", 
         lty = "solid",
         lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"))
})

dev.copy(png, filename = "plot3.png", width = 480, height = 480, units = "px")
dev.off()