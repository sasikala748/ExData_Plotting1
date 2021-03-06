#Same as getting the data and loading into R as plot1.R
power <- read.table("C:/Users/GuruJithin/Desktop/Coursera/UCI HAR Dataset/ExData_Plotting1/household_power_consumption.txt",
                    skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_date <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
#date and time should be converted top numeric vectors for ploting
datetime <- strptime(paste(sub_date$Date, sub_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime,as.numeric(as.character(sub_date$Global_active_power)), type="l",xlab="",
                              ylab="Global Active Power(kilowatts)")
# Finally save the file in png format for transferring
png("plot22.png",width=480,height=480)
dev.off()
