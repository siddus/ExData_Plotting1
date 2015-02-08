library(lubridate)
library(sqldf)
#read select data using sql query from a large given file 
hhEU<-read.csv.sql("household_power_consumption.txt", sep=";",header=TRUE, sql= "select * from file where Date='1/2/2007' OR Date='2/2/2007'")
#add new variable with Data and Time converted to PostIZlt class (proper class)
hhEU$Date.Time<-strptime(paste(hhEU$Date,hhEU$Time), "%d/%m/%Y %H:%M:%S")

#multiple graphs created in a single sheet
png("plot4.png")
par(mfcol=c(2,2)) #define 2x2 matrix to add four graphs
#plot graph-1
plot(hhEU$Date.Time, hhEU$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
#plot graph-2
plot(hhEU$Date.Time, hhEU$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(hhEU$Date.Time, hhEU$Sub_metering_2,col="red")
lines(hhEU$Date.Time, hhEU$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","green"),cex=0.75,bty='n')
#plot graph-3
plot(hhEU$Date.Time, hhEU$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot graph-4
plot(hhEU$Date.Time, hhEU$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() #close the device, preferred on macs
