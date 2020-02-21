setwd("C:/Users/MAHE/Desktop/programming/Data Science/exploratorydataanalysis")# to set working directory to downloaded dataset
pow <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')#reading data set into variable pow
pow_filtered<-subset(pow, Date %in% c("1/2/2007","2/2/2007"))#filtering out unwanted data
dt <- strptime(paste(pow_filtered$Date, pow_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gpow <- as.numeric(pow_filtered$Global_active_power)#reading required parameters and converting them to numeric
sub1 <- as.numeric(pow_filtered$Sub_metering_1)
sub2 <- as.numeric(pow_filtered$Sub_metering_2)
sub3 <- as.numeric(pow_filtered$Sub_metering_3)
gpow_reactive <- as.numeric(pow_filtered$Global_reactive_power)
volt <- as.numeric(pow_filtered$Voltage)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) #splitting the plot into 4 in 2x2 form
#plotting required parameters
plot(dt, gpow, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")
plot(dt, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sub2, type="l", col="red")
lines(dt, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dt,gpow_reactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()