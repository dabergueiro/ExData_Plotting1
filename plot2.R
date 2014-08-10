data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset <- data[data["Date"]=="1/2/2007" | data["Date"]=="2/2/2007",]
subset$NewDate <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S");

png(filename="plot2.png")
plot(subset$NewDate, as.numeric(as.character(subset$Global_active_power)), type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()