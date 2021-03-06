#Same as getting the data and loading into R as plot3.R
power <- read.table("C:/Users/GuruJithin/Desktop/Coursera/UCI HAR Dataset/ExData_Plotting1/household_power_consumption.txt",
                    skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_date <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
#date and time should be converted top numeric vectors for ploting
datetime <- strptime(paste(sub_date$Date, sub_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Like date and time all submeters has to be converted into numerics
s_meter1 <- as.numeric(sub_date$Sub_metering_1)
s_meter2 <- as.numeric(sub_date$Sub_metering_2)
s_meter3 <- as.numeric(sub_date$Sub_metering_3)
voltage <- as.numeric(sub_date$Voltage)
reactive_power <- as.numeric(sub_date$Global_reactive_power)
#since we re plotting all the four graphs in one scree at a time we need to initialise par()with mfrow=c(2,2).It will plot 
#the graph in row wise.
par(mfrow=c(2,2))
plot(datetime,as.numeric(as.character(sub_date$Global_active_power)), type="l",xlab="",
     ylab="Global Active Power(kilowatts)") # first plt will appear
plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage") # second one will appear
plot(datetime,s_meter1,type="l",xlab="",ylab="Energy Submetering")# third plot will come into the screen
lines(datetime,s_meter2,type="l",col="red")
lines(datetime,s_meter3,type="l",col="blue")
# since it is necessary to mention the three sub_mterers we have to use legend
legend("topright",c("s_meter1","s_meter2","s_meter3"),lty=1,lwd=2.5,col=c("black","red","blue"))
plot(datetime,reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power") # this is the final plot 
# to save the output as a image
png("plot4.png",width=480,height=480)
dev.off() # to close the file device