data<- read.table ("household_power_consumption.txt", header = TRUE, nrows=2075260, sep = ";", na.strings = "?")
data<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
data$DateTime<- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S" )
data<- na.omit(data)
Sys.setlocale("LC_TIME", "English")
data$DateTime<-as.POSIXct(data$DateTime)
dev.copy(png,'plot2.png', width = 480, height = 480)
plot( data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab =NA)
dev.off()