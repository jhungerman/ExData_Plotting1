#get data from directory
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"), stringsAsFactors = FALSE)
#convert the date column from character to date POS date in DD/MM/YYYY format
epc$DateTime <- strptime(paste(epc$Date, epc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#subset the data to use only 2 dates
epc <- subset(epc, as.Date(DateTime) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
#par to set-up multiplot
par(mfrow=c(2,2))
#create a base R line plot with proper formatting in top left position
with(epc, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
#create a base R line plot with proper formatting in top right position
with(epc, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
#create a base R line plot with proper formatting in bottom left position
with(epc, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
	#use lines to add additional variables to the plot
	with(epc, lines(DateTime, Sub_metering_2, col="red"))
	with(epc, lines(DateTime, Sub_metering_3, col="blue"))
	#add a legend to describe the data in the plot
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1), bty = "n")
#create a base R line plot with proper formatting in bottom right position
with(epc, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
#copy the graphical output to a png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()