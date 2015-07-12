data = read.table("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  header=TRUE,
                  stringsAsFactors=FALSE,na.strings="?")

#subset the data from dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the Date/Time Variables and combine the data in one column
subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S")

#set up the plotting frames
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#first plot
plot(subSetData$DateTime,subSetData$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")

#second plot
plot(subSetData$DateTime,subSetData$Voltage,ylab="Voltage",type="l",xlab="datetime")

#third plot
plot(subSetData$DateTime,subSetData$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(subSetData$DateTime,subSetData$Sub_metering_2, type="l", col="red")
lines(subSetData$DateTime,subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#fourth plot
plot(subSetData$DateTime,subSetData$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")

#saving into the PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()