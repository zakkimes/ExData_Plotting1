#Install package and load
install.packages("sqldf")
library(sqldf)
#reads filtered data into variable pdata
pdata <- read.csv.sql("household_power_consumption.txt", header=T, sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007'")

#creates a column in the dataset with a timestamp
pdata$tiestamp<-strptime(paste(pdata$Date,pdata$Time ,sep=" "),"%d/%m/%Y %H:%M:%S")

#creates png file to save the histogram
png(filename="plot1.png",width=480,height=480,units="px")

#creates the histogram
hist(pdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#saves the file
dev.off()
