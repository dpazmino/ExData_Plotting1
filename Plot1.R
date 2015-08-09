setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

mydata <- read.csv("d:/household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses =c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings=c("NA","NaN", "?")  
)

xdata <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

xdata$newDate <- strptime(paste(as.character(xdata$Date), as.character(xdata$Time), sep = " "), "%y-%m-%d %H:%m")





png("Plot1.png", width=480, height=480)
hist(xdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
