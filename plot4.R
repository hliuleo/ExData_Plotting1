data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

# subset data for desired date
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subData$Timestamp <- strptime(paste(subData$Date,subData$Time),
                              format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# plotting 1
plot(subData$Timestamp, subData$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# plotting 2
plot(subData$Timestamp, subData$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
    
# plotting 3
plot(subData$Timestamp, subData$Sub_metering_1,
     type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(subData$Timestamp, subData$Sub_metering_2, col="red")
lines(subData$Timestamp, subData$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       box.lwd=0)

# plotting 4
plot(subData$Timestamp, subData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
    
dev.off()
