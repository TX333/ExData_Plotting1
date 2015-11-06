##Read Data, need to revise script below to deal with .zip
temp<- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
hhpower<- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)

##subset to focus on relevant dates
subsetdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#str(subsetdata)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()