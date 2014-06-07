#Plot2.R  
#Amie Demmel  6/6/14
#Reconstructs the second plot

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

#Set up datetime vector from the date and time columns of data.frame and choose y to plot with
x <- paste(s.data$Date,s.data$Time, sep = " ")
x <- strptime(x, format = "%Y-%m-%d %H:%M:%S")
y <- s.data$Global_active_power

#Open device and plot using lines to generate the line graph
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(x,y, xlab ="", ylab ="Global Active Power(kilowatts)", type="n")
lines(x,y)
dev.off()

#remove large data vectors/tables to clean workspace, commit out if data.frame is needed later
rm(s.data)
rm(x)
rm(y)
rm(ss)