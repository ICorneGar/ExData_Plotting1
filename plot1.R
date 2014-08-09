## Reading dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Changing data from type character to type double (as date).
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

## Creating the subset with the observations between 2007-02-01 and 2007-02-02
sub_data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting Datetime  
datetime <- paste(as.Date(sub_data$Date), sub_data$Time); sub_data$Datetime <- as.POSIXct(datetime)

## Creating Plot 1 object
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file of 480x480 size
dev.copy(png, file="plot1.png", height=480, width=480)

## closing device
dev.off()