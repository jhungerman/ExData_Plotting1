#get data from directory
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"), stringsAsFactors = FALSE)
#convert the date column from character to date POS date in DD/MM/YYYY format
epc$DateTime <- strptime(paste(epc$Date, epc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#subset the data to use only 2 dates
epc <- subset(epc, as.Date(DateTime) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
#create a base R line plot with proper formatting
with(epc, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#copy the graphical output to a png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()