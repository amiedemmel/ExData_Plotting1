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
y <- s.data$Global_active_power

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(x,y, xlab ="", ylab ="Global Active Power(kilowatts)", type="n")
lines(x,y)
dev.off()

rm(s.data)
rm(x)
rm(y)
rm(ss)