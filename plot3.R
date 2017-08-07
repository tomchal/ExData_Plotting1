### Prepare Data ###
DateStart <- as.POSIXlt("2007-02-01 00:00:00")
DateEnd <- as.POSIXlt("2007-02-02 23:59:59")

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = '?', blank.lines.skip = TRUE)

DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

data<- cbind(data,DateTime)

data <- data[data$DateTime >= DateStart & data$DateTime <= DateEnd,]

data<- data[complete.cases(data),]


### Plot Data ###
png("plot3.png", width=480, height=480)

plot(data$Sub_metering_1~data$DateTime ,type="l",ylab = "Energy sub metering",xlab="", col="black")

lines(data$Sub_metering_2~data$DateTime, type="l", col="red")
lines(data$Sub_metering_3~data$DateTime, type="l", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

dev.off()

