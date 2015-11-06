##Read Data, need to revise script below to deal with .zip
temp<- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
hhpower<- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)

##subset to focus on relevant dates
subsetdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#str(subsetdata)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

SubMetering1 <- as.numeric(subsetdata$Sub_metering_1)
SubMetering2 <- as.numeric(subsetdata$Sub_metering_2)
SubMetering3 <- as.numeric(subsetdata$Sub_metering_3)

#plot
png("plot3.png", width=480, height=480)
plot(datetime, SubMetering1, type="l", ylab="Energy SubMetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()