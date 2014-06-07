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

png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

#First Plot
#Plot 2
y <- s.data$Global_active_power
plot(x,y, xlab ="", ylab ="Global Active Power(kilowatts)", type="n")
lines(x,y)

#Second Plot
#Plot 3
sub_metering_1 <- s.data$Sub_metering_1
sub_metering_2 <- s.data$Sub_metering_2
sub_metering_3 <- s.data$Sub_metering_3

plot(x,sub_metering_1, xlab ="", ylab ="Energy sub metering", type="n")
par(pch=22, col="red")
lines(x,sub_metering_3)

par(pch=22, col="blue")
lines(x,sub_metering_2)

par(pch=22, col="black")
lines(x,sub_metering_1)

legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red","blue"), pch = "_____")

#Thrid Plot
#Voltage vs timedate
plot(x,s.data$Voltage, xlab ="timedate", ylab = "Voltage", type="n")
lines(x,s.data$Voltage)

#Fourth Plot
#Global_Reactive_Power vs timedate
plot(x,s.data$Global_reactive_power, xlab = "timedate", ylab = "Global_reactive_power", type="n")
lines(x,s.data$Global_reactive_power)

dev.off()

#set par(mfcol) to default environment
#par(mfcol = c(1,1))

#clean up workspace
rm(s.data)
rm(x)
rm(y)
rm(ss)
rm(sub_metering_1)
rm(sub_metering_2)
rm(sub_metering_3)