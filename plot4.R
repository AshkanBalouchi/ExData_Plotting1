library(data.table)
dat <- read.table("household_power_consumption.txt" ,
                  header = TRUE , 
                  sep = ";" , 
                  colClasses = c("character","character","numeric",
                                 "numeric","numeric","numeric",
                                 "numeric","numeric","numeric"),
                  na="?")
cdat <- subset(dat,Date == "1/2/2007" | Date == "2/2/2007")
cdat$time <- paste(cdat$Date,cdat$Time)
cdat$time <- strptime(cdat$time, "%d/%m/%Y %H:%M:%S")
rownames(cdat) <- 1:nrow(cdat)

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
plot(cdat$time, cdat$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

plot(cdat$time, cdat$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(cdat$time, cdat$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(cdat$time, cdat$Sub_metering_2, col = "red")
lines(cdat$time, cdat$Sub_metering_3, col = "blue")

legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

plot(cdat$time, cdat$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()