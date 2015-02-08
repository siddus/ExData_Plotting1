library(lubridate)
library(sqldf)

#read select data using sql query from a large given file 
hhEU<-read.csv.sql("household_power_consumption.txt", sep=";",header=TRUE, sql= "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

#add new variable with Data and Time converted to PostIZlt class (proper class)
hhEU$Date.Time<-strptime(paste(hhEU$Date,hhEU$Time), "%d/%m/%Y %H:%M:%S")

#create a histogram as a .png file
png("plot2.png")
#plot a linegraph
plot(hhEU$Date.Time, hhEU$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
#close the device (I guess on mac it is advised)
dev.off()
