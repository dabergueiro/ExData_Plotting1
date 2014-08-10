data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset <- data[data["Date"]=="1/2/2007" | data["Date"]=="2/2/2007",]
subset$NewDate <- as.Date(subset$Date, "%m/%d/%Y")
png(filename="plot1.png")
hist(as.numeric(as.character(subset[,"Global_active_power"])), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()