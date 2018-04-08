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

# Plot 3 : Line graph of Energy sub metering
png("plot3.png", width = 480, height = 480)

plot(hpc_feb$datetime, hpc_feb$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hpc_feb$datetime, hpc_feb$Sub_metering_2, type = "l", col = "red")
lines(hpc_feb$datetime, hpc_feb$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))


dev.off()



