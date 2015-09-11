## I use read.table to get data between 01feb2007 and 02feb2007. Raw data included 
## in "household_power_consumption.txt" must be in the working directory

var_types<-c("character","character","numeric","numeric","numeric","numeric",
             "numeric","numeric","numeric")
var_names<-unlist(strsplit (readLines ("household_power_consumption.txt",1),split = ";"))
data<-read.table ("household_power_consumption.txt",header=FALSE,sep = ";", na.strings = "?"
                  ,stringsAsFactors = FALSE, colClasses = var_types,skip = 66637, nrows = 2880
                  ,col.names = var_names)
date<-as.Date (data$Date, format = "%d/%m/%Y")

datetime<-strptime (x = paste (date,data[,2]),format = "%Y-%m-%d %H:%M:%S")

## This creates in required plot in a png device called "plot3.png"

png (filename = "plot3.png", width =  480, height = 480, units = "px" )

plot (datetime,data$Sub_metering_1, type="l"
      , ylab="Energy sub metering", xlab=NA, col="black")
lines (datetime,data$Sub_metering_2, col="red")
lines (datetime,data$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),lty = 1)

dev.off()