url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip")
unzip(zipfile="//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/data.zip", exdir = "//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads")
data <- read.table("//Txdf2fpw01cbtp/txcbt-redirected/smb001/Downloads/household_power_consumption.txt",header=FALSE, skip=66637, sep=";", nrows=2880)
names(data)<-c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
head(data)
##########Plot 1
Plot1 <- function (){
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
}
Plot1()
