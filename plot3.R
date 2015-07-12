data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

# subset data for desired date
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subData$Timestamp <- strptime(paste(subData$Date,subData$Time),
                              format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(subData$Timestamp, subData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(subData$Timestamp, subData$Sub_metering_2, col="red")
lines(subData$Timestamp, subData$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

dev.off()

