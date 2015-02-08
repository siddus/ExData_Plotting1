library(lubridate)
library(sqldf)
#read select data using sql query from a large given file 
hhEU<-read.csv.sql("household_power_consumption.txt", sep=";",header=TRUE, sql= "select * from file where Date='1/2/2007' OR Date='2/2/2007'")
#add new variable with Data and Time converted to PostIZlt class (proper class)
hhEU$Date.Time<-strptime(paste(hhEU$Date,hhEU$Time), "%d/%m/%Y %H:%M:%S")

#Create Line Graph of three different variables -Plot 3
png("plot3.png")
plot(hhEU$Date.Time, hhEU$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(hhEU$Date.Time, hhEU$Sub_metering_2,col="red")
lines(hhEU$Date.Time, hhEU$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","green"),cex=0.75)
dev.off() #close the device, preferred on macs
