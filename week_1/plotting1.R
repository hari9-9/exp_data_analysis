setwd("C:/Users/MAHE/Desktop/programming/Data Science/exploratorydataanalysis")# to set working directory with downloaded dataset
pow <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')#reading data set into variable pow
pow_filtered<-subset(pow, Date %in% c("1/2/2007","2/2/2007"))#filtering out unwanted data
pow_filtered$Date <- as.Date(pow_filtered$Date)#formatting date
hist(pow_filtered$Global_active_power,col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")#plotting histogram
dev.copy(png, file="plot1.png", height=480, width=480)# saving it into png file with requiered specifications
dev.off()
