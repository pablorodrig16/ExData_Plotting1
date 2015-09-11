## I use read.table to get data between 01feb2007 and 02feb2007. Raw data included 
## in "household_power_consumption.txt" must be in the working directory

var_types<-c("character","character","numeric","numeric","numeric","numeric",
             "numeric","numeric","numeric")
var_names<-unlist(strsplit (readLines ("household_power_consumption.txt",1),split = ";"))
data<-read.table ("household_power_consumption.txt",header=FALSE,sep = ";", na.strings = "?"
                  ,stringsAsFactors = FALSE, colClasses = var_types,skip = 66637, nrows = 2880
                  ,col.names = var_names)


## This creates in required histogram in a png device called "plot1.png"

png (filename = "plot1.png", width =  480, height = 480, units = "px" )

hist (data$Global_active_power, col="red", main="Global Active Power",
             xlab="Global Active Power (kilowatts)")

dev.off()