#get data from directory
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","NULL","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"), stringsAsFactors = FALSE)
#convert the date column from character to date POS date in DD/MM/YYYY format
epc$Date <- strptime(epc$Date, "%d/%m/%Y")
#subset the data to use only 2 dates
epc <- subset(epc, Date %in% c("2007-02-01","2007-02-02"))
#create a base R histogram with proper formatting
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
#copy the graphical output to a png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()