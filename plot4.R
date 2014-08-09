## Reading dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Changing data from type character to type double (as date).
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

## Creating the subset with the observations between 2007-02-01 and 2007-02-02
sub_data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting Datetime  
datetime <- paste(as.Date(sub_data$Date), sub_data$Time); sub_data$Datetime <- as.POSIXct(datetime)

## Creating plot 3 object
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) #Plot layout

with(sub_data, {
                  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") #plot (1,1)
                  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="") #plot (1,2)
                  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") #plot (2,1)
                  lines(Sub_metering_2~Datetime,col='Red'); lines(Sub_metering_3~Datetime,col='Blue')
                  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="") #plot (2,2)
               }
     )

## Saving to png file of 480x480 size
dev.copy(png, file="plot4.png", height=480, width=480)

## closing device
dev.off()
