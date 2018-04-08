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

# Plot 2 : Line graph of Global Active Power
png("plot2.png", width = 480, height = 480)

with(hpc_feb, plot(datetime, Global_active_power, type = "l", xlab = "",
               ylab = "Global Active Power (kilowatts)"))

dev.off()

