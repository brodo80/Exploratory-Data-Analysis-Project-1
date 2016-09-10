url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip")
unzip(zipfile="//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip", exdir = "//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads")
data <- read.table("//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/household_power_consumption.txt",header=FALSE, skip=66637, sep=";", nrows=2880)
names(data)<-c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
head(data)
#####plot4
plot4 <- function() {
par(mfrow = c(2,2))
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power', type = "l")
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = "l")
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = "l")
lines(data$DateTime,data$Sub_metering_2, col="red")
lines(data$DateTime,data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), bty = 'n', cex = .25, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$DateTime, data$Global_active_power, xlab = 'datetime', ylab = 'Global_active_power', type = "l")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()     
}
plot4()
