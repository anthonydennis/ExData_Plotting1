## Exploratory Data Analysis
## Project 1 - Plot 2

library(datasets)
## read Household Power Consumption Dataset  - missing values are '?'
hhldpwrcons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subset dataset to date range required for plot
hpc <- subset(hhldpwrcons, Date == "1/2/2007" | Date == "2/2/2007")

hpc <- na.omit(hpc)         ## Get rid of NA data

## convert Date and Time variable to single DateTime
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")        


## Plot line graph - Global Active Pover over time
plot(x=hpc$Date, y=hpc$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")   ## Copy my plot to a PNG file
dev.off()                           ## Close the PNG device!
