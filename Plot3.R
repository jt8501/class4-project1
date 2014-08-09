Plot3 <- function() {
        dat <- read.table(file=".\\household_power_consumption.txt",
                          sep=";",
                          header=TRUE,
                          stringsAsFactors=FALSE)
        dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]
        dat$Global_active_power <- as.double(dat$Global_active_power)
        dates <- paste(dat$Date, dat$Time)
        dates <- strptime(dates, format="%d/%m/%Y %H:%M:%S")
        sub1 <- as.numeric(dat$Sub_metering_1)
        sub2 <- as.numeric(dat$Sub_metering_2)
        sub3 <- as.numeric(dat$Sub_metering_3)
        png(file="Plot3.png", width=480, height=480)
        plot(dates, sub1, type="n", xlab="", ylab="Energy sub metering")
        lines(dates, sub1, col="black")
        lines(dates, sub2, col="red")
        lines(dates, sub3, col="blue")
        legend("topright",
               lty=1,
               col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}