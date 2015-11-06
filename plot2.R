##Read Data, need to revise script below to deal with .zip
temp<- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
hhpower<- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)

##subset to focus on relevant dates
subsetdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#str(subsetdata)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()