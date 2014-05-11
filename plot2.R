dev.new()
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses=c("character","character",rep("numeric",7)))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
dataToPlot <- data[as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) <= "2007-02-02",]
with(dataToPlot, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
