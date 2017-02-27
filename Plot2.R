file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

x <- paste(subdata$Date, subdata$Time, sep = " ")
dateandtime <- strptime(x, "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subdata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(dateandtime, global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()