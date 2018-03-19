tab <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
> tab$Date <- as.Date(tab$Date, "%d/ %m/ %Y")
> tab <- subset (tab, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) 
> tab <- tab[complete.cases(tab),]
> dateTime <- paste(tab$Date, tab$Time)
> dateTime <- setNames(dateTime, "DateTime")
> tab <- tab[,!(names(tab) %in% c("date", "Time"))]
> tab <- cbind(dateTime, tab)
> tab$dateTime <- as.POSIXct(dateTime)
 with(tab,{
+     plot(Sub_metering_1~dateTime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~dateTime,col='Red')
+     lines(Sub_metering_3~dateTime,col='Blue')
+   })
>   legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
+          c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> dev.copy(png, file="plot3.png", height=480, width=480)

