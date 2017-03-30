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

#make plot 3
png("plot3.png", width=480, height=480)
Sys.setlocale("LC_TIME", "en_US.utf8")
plot(data$date_time, data$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_1, col = "black")
lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
