#Plot3.R  
#Amie Demmel  6/6/14
#Reconstructs the third plot

#Read in data from already download file, make sure your files matches
file <- "Coursera/exdata-data-household_power_consumption.zip"

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

#Set up datetime vector from the date and time columns of data.frame and choose var for easier typing later
x <- paste(s.data$Date,s.data$Time, sep = " ")
x <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

sub_metering_1 <- s.data$Sub_metering_1
sub_metering_2 <- s.data$Sub_metering_2
sub_metering_3 <- s.data$Sub_metering_3

#Open device and plot using lines to generate the line graph
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(x,sub_metering_1, xlab ="", ylab ="Energy sub metering", type="n")
par(pch=22, col="red")
lines(x,sub_metering_3)

par(pch=22, col="blue")
lines(x,sub_metering_2)

par(pch=22, col="black")
lines(x,sub_metering_1)

legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red","blue"), pch = "_____")
dev.off()

#remove large data vectors/tables to clean workspace, commit out if data.frame is needed later
rm(s.data)
rm(x)
rm(sub_metering_1)
rm(sub_metering_2)
rm(sub_metering_3)
rm(ss)