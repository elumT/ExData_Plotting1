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

Sys.setlocale("LC_ALL", "en_US.utf8")
#make plot 2
png("plot2.png", width=480, height=480) #width and height have these values by default, but just to make it explicit
plot(data$date_time, data$Global_active_power, xlab = NA,  ylab = "Global active power(kilowatts)", type = "n", main = "")
lines(data$date_time, data$Global_active_power, lty = 1)
dev.off()
