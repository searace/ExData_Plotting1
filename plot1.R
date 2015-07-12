data = read.table("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  header=TRUE,
                  stringsAsFactors=FALSE,na.strings="?")

#subset the data from dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the Date/Time Variables and combine the data in one column
subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S")

#Plot 1
hist(subSetData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#saving to file
dev.copy(png, file = "plot1.png", height=480, width=480 )
dev.off()
