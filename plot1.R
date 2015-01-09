# exploratory data analysis project 1  jan 09, 2015 

#1 Read data into hpc
#options("width"=160)
hpc<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

#2 We will only be using data from the dates 2007-02-01 and 2007-02-02 
hpc2<-hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="plot1.png",width=480,height=480)
hist(hpc2$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
