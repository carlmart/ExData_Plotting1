# exploratory data analysis project 1  jan 09, 2015 

#1 Read data into hpc
#options("width"=160)
hpc <- read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

#2 We will only be using data from the dates 2007-02-01 and 2007-02-02 
hpc2 <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpc2$Date <- as.Date(hpc2$Date,format="%d/%m/%Y")

daytime <- data.frame(paste(hpc2$Date,hpc2$Time,sep=" "))
names(daytime)<-"daytime"
hpc2 <- cbind(hpc2,daytime)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# default to pdf  for batch mode

png(filename="plot2.png",width=480,height=480)
# option axes=FALSE suppresses both x and y axes. xaxt="n" and yaxt="n" suppress the x or y axis 
plot(hpc2$daytime,hpc2$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xaxt="n")
lines(hpc2$daytime,hpc2$Global_active_power,ylab="Global Active Power (kilowatts)")
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))

#plot(hpc2$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
