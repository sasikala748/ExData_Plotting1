# The first step is to check and reset the working Directory
getwd()# for checkinfg the directory
# Then read the data into R workspace
power <- read.table("C:/Users/GuruJithin/Desktop/Coursera/UCI HAR Dataset/ExData_Plotting1/household_power_consumption.txt",
                                        skip=1,sep=";")

head(power) #Checking first few lines of loaded data and some initial steps to check
View(power)
dim(power)
summary(power)
str(power)
ncol(power)
nrow(power)
#Since I skipped the first line we have to give the names of all the variables
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_date <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
#To call the histogram in base plotting function by hist()
hist(as.numeric(as.character(sub_date$Global_active_power)),col="red",main="Global Active Power"
                             ,xlab="Global Active Power(Kilowatts)")
# For giving the main title of the histogram we have to call title as annotation
title(main="Global Active Power")
png("plot11.png",width=480,height=480)
dev.off()
