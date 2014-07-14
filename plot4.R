dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=';', na.strings = "?")
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- as.POSIXlt(dat$DateTime)

par(mfrow = c(2, 2), mar = c(5,5,2,1))
plot(dat$DateTime, dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")
plot(dat$DateTime, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime ")
plot(dat$DateTime, dat$Sub_metering_1, type = "l", col = "black",xlab = " ", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"), lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(dat$DateTime, dat$Global_reactive_power, type = "l", ylab = "Global rective power", xlab = "datetime ")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off