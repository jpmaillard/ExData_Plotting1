# Class: Exploratory Data Analysis
# Script Name: Plot1.R
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
consumption <- filter(data, Date=="01/02/2007" | Date=="02/02/2007")

# make the png
png("plot1.png", width = 480, height = 480)
with(consumption, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatt)", ylab = "Frequency", col="red"))
dev.off()
