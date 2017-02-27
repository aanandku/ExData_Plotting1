file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

global_active_power <- as.numeric(subdata$Global_active_power)

x <- paste(subdata$Date, subdata$Time, sep = " ")
dateandtime <- strptime(x, "%d/%m/%Y %H:%M:%S")

submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dateandtime, submetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateandtime, submetering2, type = "l", col="red")
lines(dateandtime, submetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()