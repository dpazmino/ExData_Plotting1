setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

mydata <- read.csv("d:/household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses =c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings=c("NA","NaN", "?")  
)

xdata <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

xdata$newDate <- strptime(paste(as.character(xdata$Date), as.character(xdata$Time), sep = " "), "%Y-%m-%d %H:%M")





png("Plot2.png", width=480, height=480)
plot(xdata$newDate, xdata$Global_active_power,  main="Global Active Power", ylab="Global Active Power (kilowatts)", xlab="", type = "l")
dev.off()

