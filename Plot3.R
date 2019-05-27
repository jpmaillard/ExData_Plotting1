# Class: Exploratory Data Analysis
# Script Name: Plot3.R
# Author: Jean-Philippe Maillard
# Assignment: Week 1 Project 1
# Type: Plotting
# Packages: data.table, dplyr
# Assumptions: packages installed, working directory identical
#              than file folder.



# first load necessary packages
library(data.table)
library(dplyr)

# load the data into R console using dat.table package
data <- fread("household_power_consumption", sep=";", na.strings = "?", Header=TRUE, stringsAsFactors = FALSE)

# take the subset for dates 
consumption <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# convert dates and create the timestamp variable
DateTime <- with(consumption, (strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S" )))
consumption$Date <- as.Date(consumption$Date, "%dd/%mm%yyyy")

# open the png device
png("plot3.png", width = 480, height = 480)

# create the plot on the device
with(consumption, plot(DateTime, Sub_metering_1, type="l", ylab = "Energy Submettering", xlab = ""))
with(consumption, lines(DateTime, Sub_metering_2, col="red"))
with(consumption, lines(DateTime, Sub_metering_3, col="blue"))

# we had the legend
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# we close the device
dev.off()

