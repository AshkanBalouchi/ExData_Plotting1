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

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(cdat$time, cdat$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()