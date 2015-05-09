## Read in the data
x <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep=";",
                 na.strings=c("?"),
                 colClasses=c("character", "character", rep(c("numeric"), 7)))


## Subset the data to Feb 1 & 2, 2007
## Convert character date/time, to date/time variable
z <- x[x$Date=="1/2/2007"|x$Date=="2/2/2007", ]
z$DTM <- strptime(paste(z$Date, z$Time), format="%d/%m/%Y %H:%M:%S")

str(z)
head(z)


## General settings
png(file=".\\plot4.png", width = 480, height = 480)
par(font.lab=1, font.main=2)
par(mfrow=c(2, 2))


## Panel plot
# plot in row 1, column 1
with(z, plot(DTM, Global_active_power, 
             type="n",
             col="black",
             xlab=" ", 
             ylab="Global Active Power (kilowatts)"))

with(z, lines(DTM, Global_active_power, col="black"))

# plot in row 1, column 2
with(z, plot(DTM, Voltage, 
             type="n",
             col="black",
             xlab=" ", 
             ylab="Voltage"))

with(z, lines(DTM, Voltage, col="black"))

# plot in row 2, column 1
with(z, plot(DTM, Sub_metering_1, 
             type="n",
             col="black",
             xlab=" ", 
             ylab="Energy sub metering"))

with(z, lines(DTM, Sub_metering_1, col="black"))
with(z, lines(DTM, Sub_metering_2, col="red"))
with(z, lines(DTM, Sub_metering_3, col="blue"))
legend("topright", x.intersp = -0.5,
       col=c("black", "red", "blue"),
       lty=1,
       cex = 0.8,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot in row 2, column 2
with(z, plot(DTM, Global_reactive_power, 
             type="n",
             col="black",
             xlab=" ", 
             ylab="Global Reactive Power"))

with(z, lines(DTM, Global_reactive_power, col="black"))

dev.off()


