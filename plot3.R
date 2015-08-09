# Install the sqldf package which will help us filter out data initiall while reading from the file
install.packages("sqldf")
library(sqldf)

# Read the data from the text file into data frame using sql query to filter on date
data <- read.csv.sql( file ="household_power_consumption.txt", header = TRUE, sep=";", sql = "select * from file where Date in ('1/2/2007','2/2/2007')")

# Add a DateTime column and compute the values by appling the strptime function on Date andTime column
data$DateTime = strptime(x = paste( data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Invoke the PNG device
png( filename = "plot3.png", width=480, height = 480, units = "px")

# Plot the line graph as per requirement
plot( data$DateTime, data$Sub_metering_1, type ="l", col= "BLACK" , ylab = "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col="RED", type="l" )
lines(data$DateTime, data$Sub_metering_3, col="BLUE", type="l" )
legend("topright" , legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("BLACK","RED","BLUE"), lwd=1)

# Close the device so that the plot is saved as a png file
dev.off()