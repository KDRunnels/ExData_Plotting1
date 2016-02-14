library("sqldf")

sourceData <- "./Irvine-MLR/household_power_consumption.txt"
fi = file(sourceData)
df <- sqldf("select * from fi where Date in ('2/2/2007','1/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(df$datetime, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(df$datetime, df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()