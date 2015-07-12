data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")
# subset data for desired date
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot1.png", width=480, height=480)
hist(subData$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
