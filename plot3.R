library(lubridate)

basedata <- read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", stringsAsFactors=FALSE, na.strings = "?")
workdata <- subset(basedata, Date=="1/2/2007"| Date=="2/2/2007")

rm(basedata)

workdata$datetime <- paste(workdata$Date, workdata$Time)
workdata$datetime <- parse_date_time(workdata$datetime, "d!m!Y! H!M!S!")


png(filename = "plot3.png")

with(workdata,plot(datetime,Sub_metering_1,ylab="Energy sub metering",
                   xlab="", type="s"))
with(workdata,lines(datetime,Sub_metering_2,col="red",type="s"))
with(workdata,lines(datetime,Sub_metering_3,col="blue",type="s"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)


dev.off()