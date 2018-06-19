hpc <- read.csv("C:/Users/Nicolas Vincent/Google Drive/R/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep=";", na.strings="?")
dates <- c("1/2/2007","2/2/2007")
hpc <- hpc[hpc$Date %in% dates,]

DT <- paste(hpc[,1],hpc[,2],sep=" ")
DT <- strptime(DT,format="%d/%m/%Y %H:%M:%S")
hpc[,1] <- as.data.frame(DT)
remove(DT)
remove(dates)

rownames(hpc) <- NULL

png(filename="plot3.png", width = 480, height = 480)
par(mfrow = c(1, 1), mar = c(4, 4, 3, 2), oma = c(1, 0, 1, 1),bg = "transparent")

plot(hpc$Date,hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",bg = "transparent")
lines(hpc$Date,hpc$Sub_metering_2,col="red",type="l")
lines(hpc$Date,hpc$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"),bg = "transparent")

dev.off()

remove(hpc)