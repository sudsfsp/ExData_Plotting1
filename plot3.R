
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
graphData <- filter(plotData, Date=="1/2/2007"|Date=="2/2/2007") %>% select(Date:Sub_metering_3) ## extract data related only 1/2/2007 & 2/2/2007.
graphData$DateTime <- dmy_hms(paste(graphData$Date,graphData$Time)) ## make Date and Time cloumn in date class and assign to new variable. 

## Creating PNG plot

grDevices::png(filename = "./plot3.png", width = 480, height = 480)
ab <-  graphData %>% gather(class, value, Sub_metering_1:Sub_metering_3)
par (mfrow= c(1,1))
x <- ab$DateTime
y <- ab$value/1000

g <- gl (3,2880, labels = c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3" )) ## make factor of sub+metering 
plot (x,y, xlab="", ylab="Energy sub metering",  type= "n")
lines (x[g=="Sub_metering_1"], y[g=="Sub_metering_1"], col="black", lty=1)
lines (x[g=="Sub_metering_2"], y[g=="Sub_metering_2"], col="red", lty=1)
lines (x[g=="Sub_metering_3"], y[g=="Sub_metering_3"], col="blue", lty=1)

legend ("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3" ))
dev.off()## returns the number and name of the new active device (after the specified device has been shut down).