#Load Data
data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset <- data[data["Date"]=="1/2/2007" | data["Date"]=="2/2/2007",]

#Open Device
png(filename="plot1.png")

#Plot data
hist(as.numeric(as.character(subset[,"Global_active_power"])), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Close Device
dev.off()