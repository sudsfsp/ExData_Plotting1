
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
##  Note : I unzipped project dataset in my working directory and give a name data (project dataset). 
## readr package given by Hedley Wickham for reading fast dataset.  

plotData <- read_csv2("./data/household_power_consumption.txt", col_types = "ccnnnnnnn", na="?")
graphData <- filter(plotData, Date=="1/2/2007"|Date=="2/2/2007") %>% select(Date:Sub_metering_3) ## extract data related only 1/2/2007 & 2/2/2007

## Creating PNG plot

grDevices::png(filename = "./plot1.png", width = 480, height = 480)
hist(graphData$Global_active_power/1000,col = "red", xlab = "Global Active Power (Kilowatts)",
                   main="Global Active Power")
dev.off() ## returns the number and name of the new active device (after the specified device has been shut down).