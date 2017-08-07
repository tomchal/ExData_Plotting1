### Prepare Data ###
DateStart <- as.POSIXlt("2007-02-01 00:00:00")
DateEnd <- as.POSIXlt("2007-02-02 23:59:59")

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = '?', blank.lines.skip = TRUE)

DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

data<- cbind(data,DateTime)

data <- data[data$DateTime >= DateStart & data$DateTime <= DateEnd,]

data<- data[complete.cases(data),]

### Plot Data ###
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data$Global_active_power~data$DateTime,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
plot(data$Voltage~data$DateTime,type="l",ylab="Voltage",xlab="datetime")

plot(data$Sub_metering_1~data$DateTime ,type="l",ylab = "Energy sub metering",xlab="", col="black")

lines(data$Sub_metering_2~data$DateTime, type="l", col="red")
lines(data$Sub_metering_3~data$DateTime, type="l", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty = "n",lty=1,x.intersp=1)

plot(data$Global_reactive_power~data$DateTime,type="l",ylab="Global_reactive_power",xlab="datetime")

#dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
