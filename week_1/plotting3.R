setwd("C:/Users/MAHE/Desktop/programming/Data Science/exploratorydataanalysis")# to set working directory to downloaded dataset
pow <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')#reading data set into variable pow
pow_filtered<-subset(pow, Date %in% c("1/2/2007","2/2/2007"))#filtering out unwanted data
dt <- strptime(paste(pow_filtered$Date, pow_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gpow <- as.numeric(pow_filtered$Global_active_power)#reading required parameters and converting them to numeric
sub1 <- as.numeric(pow_filtered$Sub_metering_1)
sub2 <- as.numeric(pow_filtered$Sub_metering_2)
sub3 <- as.numeric(pow_filtered$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dt, sub1, type="l", ylab="Energy Submetering", xlab="")#plotting the three values on smae graph
lines(dt, sub2, type="l", col="red")
lines(dt, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))# legend for reference
dev.off()
