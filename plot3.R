# exploratory data analysis project 1  jan 09, 2015 

#1 Read data into hpc
#options("width"=160)
hpc <- read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

#2 We will only be using data from the dates 2007-02-01 and 2007-02-02 
hpc2 <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpc2$Date <- as.Date(hpc2$Date,format="%d/%m/%Y")
daytime <- data.frame(paste(hpc2$Date,hpc2$Time,sep=" "))
names(daytime) <-  "daytime"
hpc2 <- cbind(hpc2,daytime)

png(filename="plot3.png",width=480,height=480)
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
hist(hpc2$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
plot(hpc2$daytime,hpc2$Sub_metering_1,ylab="Energy sub metering",type="l",xaxt="n")
lines(hpc2$daytime,hpc2$Sub_metering_1,ylab="Energy sub metering")
#lines(hpc2$Sub_metering_1, type="l", col="black")
lines(hpc2$Sub_metering_2, type="l", col="red")
lines(hpc2$Sub_metering_3, type="l", col="blue")
axis(1,at=seq(1,4380,by = 1460),lab=c("Thu","Fri","Sat"))
#axis(1,at=1:3,lab=c("Thu","Fri","Sat"))
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.95)

#legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#axis(1,at=1:3,lab=c("Thu","Fri","Sat"))


dev.off()
