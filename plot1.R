#read data
library(data.table)
filePath <- "/home/elena/Documents/datascience/explor_analysis/household_power_consumption.txt"
colNames <- names(fread(filePath, nrows = 1, header= TRUE, sep = ";"))
data <- fread(filePath, sep=";", na.strings="?", skip = 21997 + 1440*31, nrows = 2880, data.table=FALSE)
names(data) <- colNames

##########################################################################################
#make plot 1

png("plot1.png", width=480, height=480) #width and height have these values by default, but just to make it explicit

hist(data$Global_active_power, col = "red",  ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
