#only read the data from 2007-02-01 and 2007-02-02
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', na.strings = "?")
#add the column names to the dataframe
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
#change date and time to date and time classes
dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime  <- strptime(dat$DateTime,format ="%d/%m/%Y %H:%M:%S")
with(dat, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power(kilowatts)"))
dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off