data = read.table("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  header=TRUE,
                  stringsAsFactors=FALSE,na.strings="?")

#subset the data from dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the Date/Time Variables and combine the data in one column
subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S")

#plot
plot(subSetData$DateTime,subSetData$Sub_metering_1, type="l",
     ylab="Energy Submetering", xlab="")

#annotate the lines
lines(subSetData$DateTime,subSetData$Sub_metering_2, type="l", col="red")
lines(subSetData$DateTime,subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#saving into the PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()