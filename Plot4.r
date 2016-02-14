library(sqldf)

sourceData <- "./Irvine-MLR/household_power_consumption.txt"
fi = file(sourceData)
df <- sqldf("select * from fi where Date in ('2/2/2007','1/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)


df$datetime <- strptime(paste(df$Date, df$Time, sep=" "),
                              "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(df$datetime, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power", cex=0.2)

plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(df$datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df$datetime,df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()