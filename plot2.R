library(lubridate)

basedata <- read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", stringsAsFactors=FALSE, na.strings = "?")
workdata <- subset(basedata, Date=="1/2/2007"| Date=="2/2/2007")

rm(basedata)

workdata$datetime <- paste(workdata$Date, workdata$Time)
workdata$datetime <- parse_date_time(workdata$datetime, "d!m!Y! H!M!S!")

png(filename = "plot2.png")

with(workdata,plot(datetime,Global_active_power,ylab="Global Active Power (kilowatts)",
                   xlab="", type="s"))

dev.off()