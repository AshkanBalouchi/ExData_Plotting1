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
dim(cdat)

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(cdat$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()


