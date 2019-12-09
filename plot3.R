
require("sqldf")

#reads filtered data into variable pdata
pdata <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

#gets the weekdays for the dataset
wDays <- strptime(paste(pdata$Date, pdata$Time), format='%d/%m/%Y %H:%M:%S')

#creates png file to save the plot
png(filename="plot3.png",width=480,height=480,units="px")

#plots the graph
with(pdata,plot(wDays,pdata$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub metering"))
lines(wDays,pdata$Sub_metering_2,col="red")
lines(wDays,pdata$Sub_metering_3,col="blue")

#creates legend
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#saves the file
dev.off()
