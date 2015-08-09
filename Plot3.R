setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

mydata <- read.csv("d:/household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses =c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings=c("NA","NaN", "?")  
)

xdata <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

xdata$newDate <- strptime(paste(as.character(xdata$Date), as.character(xdata$Time), sep = " "), "%Y-%m-%d %H:%M")





png("Plot3.png", width=480, height=480)
plot(xdata$newDate, xdata$Sub_metering_1, ylab="Energy Sub Metering" ,type = "l", xlab="")
plot.xy(xy.coords(xdata$newDate,xdata$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(xdata$newDate,xdata$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
