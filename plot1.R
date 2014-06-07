#Plot1.R  
#Amie Demmel  6/6/14
#Reconstructs the first plot

#Read in data from web 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "Coursera/exdata-data-household_power_consumption.zip"
download.file(fileUrl, destfile=file)

#Read as a data.frame and disgard rows that do not match Feb 1 2007 and Feb 2 2007
num <- rep("numeric",7)
classing <- c("character","character",num)
data <- read.table(unz(file, "household_power_consumption.txt"), header=T, na.strings = "?", colClasses = classing, quote="\"", sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#match dates and only keep these rows
looker <- c("2007-02-01","2007-02-02")
ss <- (data$Date == looker[1])|(data$Date == looker[2])
s.data <- data[ss,]
rm(data)

#Open device and plot with hist
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(s.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#remove large data vectors/tables to clean workspace, commit out if data.frame is needed later
rm(s.data)
rm(ss)