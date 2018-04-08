library(data.table)

# Read in dataset
hpc <- fread("./4. EDA/Course Project 1/household_power_consumption.txt",
             data.table = FALSE, na.strings = "?")

# Subset
hpc_feb <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# datetime variable add
date <- hpc_feb$Date
time <- hpc_feb$Time
datetime <- strptime(paste(date, time), format = "%d/%m/%Y %H:%M:%S")
hpc_feb <- cbind(hpc_feb, datetime)

# Plot 4 : 2 by 2 plots
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# topleft
with(hpc_feb, plot(datetime, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))

# topright
with(hpc_feb, plot(datetime, Voltage, type = "l"))

# bottomleft
plot(hpc_feb$datetime, hpc_feb$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hpc_feb$datetime, hpc_feb$Sub_metering_2, type = "l", col = "red")
lines(hpc_feb$datetime, hpc_feb$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))

# bottomright
with(hpc_feb, plot(datetime, Global_reactive_power, type = "l"))

dev.off()



