hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
dates <- c("1/2/2007","2/2/2007")
hpc <- hpc[hpc$Date %in% dates,]

DT <- paste(hpc[,1],hpc[,2],sep=" ")
DT <- strptime(DT,format="%d/%m/%Y %H:%M:%S")
hpc[,1] <- as.data.frame(DT)
remove(DT)
remove(dates)

rownames(hpc) <- NULL

png(filename="plot2.png", width = 480, height = 480)
par(mfrow = c(1, 1), mar = c(4, 4, 3, 2), oma = c(1, 0, 1, 1),bg = "transparent")
plot(hpc$Date,hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",bg = "transparent")
dev.off()

remove(hpc)