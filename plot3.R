url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip")
unzip(zipfile="//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip", exdir = "//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads")
data <- read.table("//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/household_power_consumption.txt",header=FALSE, skip=66637, sep=";", nrows=2880)
names(data)<-c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
head(data)
#######plot 3
plot3 <- function(){
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = "l")
lines(data$DateTime,data$Sub_metering_2, col="red")
lines(data$DateTime,data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))    
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
}
plot3()
