##Read Data, need to revise script below to deal with .zip
temp<- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
hhpower<- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)

##subset to focus on relevant dates
subsetdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##subset to focus on Global active power
GlobalActivePower<- as.numeric(subsetdata$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()