#read data
library(data.table)
filePath <- "/home/elena/Documents/datascience/explor_analysis/household_power_consumption.txt"
colNames <- names(fread(filePath, nrows = 1, header= TRUE, sep = ";"))
data <- fread(filePath, sep=";", na.strings="?", skip = 21997 + 1440*31, nrows = 2880, data.table=FALSE)
names(data) <- colNames

##########################################################################################
#convert date and time
data$date_time <- paste(data$Date, data$Time, sep = " ")
data$date_time <-  as.POSIXct(strptime(data$date_time, "%d/%m/%Y %H:%M:%S"))

#make plot 4
png("plot4.png", width=480, height=480)
Sys.setlocale("LC_TIME", "en_US.utf8")
par(mfrow = c(2,2))

#plot1
plot(data$date_time, data$Global_active_power, xlab = NA, ylab = "Global active power", type = "n")
lines(data$date_time, data$Global_active_power, lty = 1)

#plot2
plot(data$date_time, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(data$date_time, data$Voltage, lty = 1)

#plot3
plot(data$date_time, data$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_1, col = "black")
lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(data$date_time, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(data$date_time, data$Global_reactive_power, lty = 1)

dev.off()