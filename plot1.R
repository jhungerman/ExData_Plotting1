#load packages
#library(ggplot2)
#library(dplyr)
#library(tidyr)
#get data from directory
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","NULL","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"), stringsAsFactors = FALSE)
epc$Date <- strptime(epc$Date, "%d/%m/%Y")
epc <- subset(epc, Date %in% c("2007-02-01","2007-02-02"))
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()