library(lubridate)
library(sqldf)
#read select data using sql query from a large given file 
hhEU<-read.csv.sql("household_power_consumption.txt", sep=";",header=TRUE, sql= "select * from file where Date='1/2/2007' OR Date='2/2/2007'")
#add new variable with Data and Time converted to PostIZlt class (proper class)
hhEU$Date.Time<-strptime(paste(hhEU$Date,hhEU$Time), "%d/%m/%Y %H:%M:%S")

#create a histogram in a .png file
png("plot1.png")
hist(hhEU$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

dev.off()
