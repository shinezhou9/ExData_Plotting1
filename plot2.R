dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=';', na.strings = "?")
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- as.POSIXlt(dat$DateTime)
plot(dat$DateTime, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.copy(png, file = "plot2.png", width=480, height=480, units = "px")
dev.off
