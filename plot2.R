
require("sqldf")

#reads filtered data into variable pdata
pdata <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

#gets the weekdays from the date in the dataset
wDays <- strptime(paste(pdata$Date, pdata$Time), format='%d/%m/%Y %H:%M:%S')

#creates png file to save the plot
png(filename="plot2.png",width=480,height=480,units="px")

#plots the weekdays on the x-axis and Global Active power on the y axis
plot(wDays, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#saves the file
dev.off()
