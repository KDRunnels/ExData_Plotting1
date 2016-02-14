library("sqldf")

sourceData <- "./Irvine-MLR/household_power_consumption.txt"
fi = file(sourceData)
df <- sqldf("select * from fi where Date in ('2/2/2007','1/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

df$datetime <- strptime(paste(df$Date, df$Time, sep=" "),
                              "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()