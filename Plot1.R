# Class: Exploratory Data Analysis
# Script Name: Plot1.R
# Author: Jean-Philippe Maillard
# Assignment: Week 1 Project 1
# Type: Plotting histogram
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

# open the png device
png("plot1.png", width = 480, height = 480)

# create the histogram plot with labels, title and color
with(consumption, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red"))


# close the device
dev.off()
