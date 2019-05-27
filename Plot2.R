# Class: Exploratory Data Analysis
# Script Name: Plot2.R
# Author: Jean-Philippe Maillard
# Assignment: Week 1 Project 1
# Type: Plotting line
# Packages: data.table, dplyr
# Assumptions: packages installed, working directory identical
#              than file folder.



# first load necessary packages
library(data.table)
library(dplyr)

# load the data into R console using dat.table package
data <- fread("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)

# take the subset for dates using dplyr package
consumption <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# convert dates and create a timestamp to use in the plot
DateTime <- with(consumption, (strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S" )))
consumption$Date <- as.Date(consumption$Date, "%dd/%mm%yyyy")

# open the png device
png("plot2.png", width = 480, height = 480)

# create the line plot (type="l") with axis labels, title.
with(consumption, plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# close the device.
dev.off()

