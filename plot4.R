## Exploratory Data Analysis
## Project 1 - Plot 4

library(datasets)
## read Household Power Consumption Dataset  - missing values are '?'
hhldpwrcons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subset dataset to date range required for plot
hpc <- subset(hhldpwrcons, Date == "1/2/2007" | Date == "2/2/2007")

hpc <- na.omit(hpc)         ## Get rid of NA data

## convert Date and Time variable to single DateTime
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")        


## Plot line graphs in a 2x2 matrix 
par(mfrow=c(2,2))
with (hpc, {
        plot(x=hpc$Date, y=hpc$Global_active_power,type="l", xlab="", ylab="Global Active Power")
})

with (hpc, {
    plot(x=hpc$Date, y=hpc$Voltage,type="l", xlab="datetime", ylab="Voltage")
})

with (hpc, {
         plot(x=hpc$Date, y=hpc$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
         lines(x=hpc$Date, y=hpc$Sub_metering_2,type="l", col="red")
         lines(x=hpc$Date, y=hpc$Sub_metering_3,type="l", col="blue")}         
         )
 
    legend("topright", lty=1, col = c("black","red","blue"), cex=0.25,
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with (hpc, {
    plot(x=hpc$Date, y=hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
 
    dev.copy(png, file = "plot4.png")   ## Copy my plot to a PNG file
    dev.off()                           ## Close the PNG device