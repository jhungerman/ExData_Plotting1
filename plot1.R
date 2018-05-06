#load packages

#get data from directory
epc <- read.table("./ExpDataWk1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(as.Date("character", "%d/%m/%Y"),"NULL","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"), stringsAsFactors = FALSE)