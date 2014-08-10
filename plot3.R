data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset <- data[data["Date"]=="1/2/2007" | data["Date"]=="2/2/2007",]
subset$NewDate <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S");

png(filename="plot3.png")
with(subset, plot(subset$NewDate, as.numeric(as.character(subset$Sub_metering_1)), type="n", xlab="", ylab="Energy sub metering"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_1)), type="l", col="black"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_2)), type="l", col="red"))
with(subset, points(subset$NewDate, as.numeric(as.character(subset$Sub_metering_3)), type="l", col="blue"))
legend("topright", pch="-" , col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()