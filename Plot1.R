Plot1 <- function() {
        dat <- read.table(file=".\\household_power_consumption.txt",
                          sep=";",
                          header=TRUE,
                          stringsAsFactors=FALSE)
        dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]
        dat$Global_active_power <- as.double(dat$Global_active_power)
        hist(dat$Global_active_power,
             col="red",
             xlab="Global Active Power (kilowatts)",
             main="Global Active Power")
        dev.copy(png, file="Plot1.png", width=480, height=480)
        dev.off()
}