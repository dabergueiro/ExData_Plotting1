#load Data
data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset <- data[data["Date"]=="1/2/2007" | data["Date"]=="2/2/2007",]
subset$NewDate <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S");

#Open Device
png(filename="plot4.png")

#Set Parameter
par(mfcol=c(2,2))

#Plot 1
plot(subset$NewDate, as.numeric(as.character(subset$Global_active_power)), type="l", xlab="", ylab="Global Active Power (Kilowatts)")

#Plot 2
with(subset, plot(subset$NewDate, as.numeric(as.character(subset$Sub_metering_1)), type="n", xlab="", ylab="Energy sub metering"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_1)), type="l", col="black"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_2)), type="l", col="red"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_3)), type="l", col="blue"))
#legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd="0")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd="0", bty="n")

#Plot3
plot(subset$NewDate, as.numeric(as.character(subset$Voltage)), type="l", xlab="datetime", ylab="Voltage")

#plot4
plot(subset$NewDate, as.numeric(as.character(subset$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()