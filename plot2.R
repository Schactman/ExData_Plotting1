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


## Create a line plot of global active power over time
par(font.lab=1, font.main=2)
png(file=".\\plot2.png", width = 480, height = 480)

with(z, plot(DTM, Global_active_power, 
            type="n",
            col="black",
            xlab=" ", 
            ylab="Global Active Power (kilowatts)"))

with(z, lines(DTM, Global_active_power, col="black"))

dev.off()


