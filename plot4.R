require("sqldf")

#reads filtered data into variable pdata
pdata <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

##Get the weekdays for dates in the dataset
wDays <- strptime(paste(pdata$Date, pdata$Time), format='%d/%m/%Y %H:%M:%S')

Voltage<-as.numeric(pdata$Voltage)

Global_reactive_power<-as.numeric(pdata$Global_reactive_power)

#creates png file to save the plot
png(filename="plot4.png",width=480,height=480,units="px")

par(mfrow=c(2,2),cex=0.65)

#plots the 4 graphs

with(pdata,{
        plot(wDays, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

        plot(wDays,Voltage,type="l",xlab="datetime",ylab="voltage")
        with(pdata,plot(wDays,pdata$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub metering"))
        lines(wDays,pdata$Sub_metering_2,col="red")
        lines(wDays,pdata$Sub_metering_3,col="blue")
        legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(wDays,Global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_Power")
}
)

#saves the file
dev.off()
