### Prepare Data ###
DateStart <- as.POSIXlt("2007-02-01 00:00:00")
DateEnd <- as.POSIXlt("2007-02-02 23:59:59")

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = '?', blank.lines.skip = TRUE)

DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

data<- cbind(data,DateTime)

data <- data[data$DateTime >= DateStart & data$DateTime <= DateEnd,]

data<- data[complete.cases(data),]


### Plot Data ###
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
