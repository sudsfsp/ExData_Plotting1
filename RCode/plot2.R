
## Below command work as install automatically required package for run below code smoothly 

list.of.packages <- c("dplyr", "readr", "tidyr", "lubridate")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

## load all necessary libraries.

library(readr)
library(dplyr)
library (lubridate)
library(tidyr)

## Read data

plotData <- read_csv2("./data/household_power_consumption.txt", col_types = "ccnnnnnnn", na="?")
graphData <- filter(plotData, Date=="1/2/2007"|Date=="2/2/2007") %>% select(Date:Sub_metering_3)
graphData$DateTime <- dmy_hms(paste(graphData$Date,graphData$Time))

grDevices::png(filename = "./plot2.png", width = 480, height = 480)
plot(graphData$DateTime, graphData$Global_active_power/1000,type = "l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()