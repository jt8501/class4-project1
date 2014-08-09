Plot2 <- function() {
        dat <- read.table(file=".\\household_power_consumption.txt",
                          sep=";",
                          header=TRUE,
                          stringsAsFactors=FALSE)
        dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]
        dat$Global_active_power <- as.double(dat$Global_active_power)
        dates <- paste(dat$Date, dat$Time)
        dates <- strptime(dates, format="%d/%m/%Y %H:%M:%S")
        plot(dates,
             dat$Global_active_power,
             type="n",
             xlab="",
             ylab="Global Active Power (kilowatts)")
        lines(dates, dat$Global_active_power)
        dev.copy(png, file="Plot2.png", width=480, height=480)
        dev.off()
}