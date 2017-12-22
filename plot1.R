library(dplyr)
library(lubridate)

power_consumption <- read.table("two_days_of_household_power_consumption.txt", 
                                header = TRUE, 
                                sep = ";", 
                                na.strings = "?")

hist(power_consumption$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px")
dev.off()