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


## Create a line plot of energy sub metering over time
par(font.lab=1, font.main=2)
png(file=".\\plot3.png", width = 480, height = 480)

with(z, plot(DTM, Sub_metering_1, 
             type="n",
             col="black",
             xlab=" ", 
             ylab="Energy sub metering"))

with(z, lines(DTM, Sub_metering_1, col="black"))
with(z, lines(DTM, Sub_metering_2, col="red"))
with(z, lines(DTM, Sub_metering_3, col="blue"))
legend("topright", 
       col=c("black", "red", "blue"),
       lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

