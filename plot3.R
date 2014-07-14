dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=';', na.strings = "?")
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- as.POSIXlt(dat$DateTime)
topY <- max(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3)
lowY <- min(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3)
plot(dat$DateTime, dat$Sub_metering_1, type = "l", col = "black", ylim = c(lowY, topY),xlab = " ", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"),  lty = "solid",  , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height=480, units = "px")
dev.off
#use cex, x.intersp and y.intersp to adjust legend