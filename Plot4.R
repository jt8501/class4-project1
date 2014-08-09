Plot4 <- function() {
        dat <- read.table(file=".\\household_power_consumption.txt",
                          sep=";",
                          header=TRUE,
                          stringsAsFactors=FALSE)
        dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]
        png(file="Plot4.png", width=480, height=480)
        par(mfrow = c(2,2))
        
        ## Creating Plot at [1,1]
        dates <- paste(dat$Date, dat$Time)
        dates <- strptime(dates, format="%d/%m/%Y %H:%M:%S")
        plot(dates, 
             dat$Global_active_power, 
             type="n",
             ylab="Global Active Power",
             xlab="",
             cex=.5)
        lines(dates, dat$Global_active_power, col="black")
        
        ##Creating Plot at [1,2]
        plot(dates,
             dat$Voltage,
             type="n",
             xlab="datetime",
             ylab="Voltage",
             cex=.5)
        lines(dates, dat$Voltage, col="black")
        
        ## Creating Plot at [2,1]
        sub1 <- as.numeric(dat$Sub_metering_1)
        sub2 <- as.numeric(dat$Sub_metering_2)
        sub3 <- as.numeric(dat$Sub_metering_3)
        plot(dates, sub1, type="n", xlab="", ylab="Energy sub metering")
        lines(dates, sub1, col="black")
        lines(dates, sub2, col="red")
        lines(dates, sub3, col="blue")
        legend("topright",
               lty=1,
               bty="n",
               col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## Creating Plot at [2,2]
        plot(dates,
             dat$Global_reactive_power,
             type="n",
             xlab="datetime",
             ylab="Global_reactive_power",
             cex=.5)
        lines(dates, dat$Global_reactive_power, col="black")
        dev.off()
}