file <- "Coursera/exdata-data-household_power_consumption.zip"
num <- rep("numeric",7)
classing <- c("character","character",num)
data <- read.table(unz(file, "household_power_consumption.txt"), header=T, na.strings = "?", colClasses = classing, quote="\"", sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
looker <- c("2007-02-01","2007-02-02")
ss <- (data$Date == looker[1])|(data$Date == looker[2])
s.data <- data[ss,]
rm(data)

x <- paste(s.data$Date,s.data$Time, sep = " ")
x <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

sub_metering_1 <- s.data$Sub_metering_1
sub_metering_2 <- s.data$Sub_metering_2
sub_metering_3 <- s.data$Sub_metering_3

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

rm(s.data)
rm(x)
rm(sub_metering_1)
rm(sub_metering_2)
rm(sub_metering_3)
rm(ss)