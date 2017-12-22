library(dplyr)
library(lubridate)

power_consumption <- read.table("two_days_of_household_power_consumption.txt", 
                                header = TRUE, 
                                sep = ";", 
                                na.strings = "?")

power_consumption <- tbl_df(power_consumption) %>%
  mutate(Moment = ymd_hms(paste(Date, Time)))

with(power_consumption, {
  par(mfrow = c(2, 2), mar = c(5, 4, 1, 1))

  plot(Moment, Global_active_power, type = "n", xlab = "Time", ylab = "Global Active Power")
  lines(Moment, Global_active_power)
  
  plot(Moment, Voltage, type = "n", xlab = "Time", ylab = "Voltage")
  lines(Moment, Voltage)

  plot(Moment, Sub_metering_1, type = "n", xlab = "Time", ylab = "Energy sub metering")
  lines(Moment, Sub_metering_1, col = "black")
  lines(Moment, Sub_metering_2, col = "red")
  lines(Moment, Sub_metering_3, col = "blue")
  legend("topright", 
         bty = "n",
         lty = "solid",
         lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"))

  plot(Moment, Global_reactive_power, type = "n", xlab = "Time", ylab = "Global Rective Power")
  lines(Moment, Global_reactive_power)
})

dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()