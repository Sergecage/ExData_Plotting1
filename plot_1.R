tab <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
> tab$Date <- as.Date(tab$Date, "%d/ %m/ %Y")
> tab <- subset (tab, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) 
> tab <- tab[complete.cases(tab),]
> dateTime <- paste(tab$Date, tab$Time)
> dateTime <- setNames(dateTime, "DateTime")
> tab <- tab[,!(names(tab) %in% c("date", "Time"))]
> tab <- cbind(dateTime, tab)
> tab$dateTime <- as.POSIXct(dateTime)
 hist(tab$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
