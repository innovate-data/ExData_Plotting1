install.packages("sqldf")
library(sqldf)
data <- read.csv.sql( file ="household_power_consumption.txt", header = TRUE, sep=";", sql = "select * from file where Date in ('1/2/2007','2/2/2007')")
data$DateTime = strptime(x = paste( data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png( filename = "plot2.png", width=480, height = 480, units = "px")
plot(x=data$DateTime,y= data$Global_active_power, ylab="Global Active Power (kilowatts)" , xlab="", type ="l")
dev.off()

