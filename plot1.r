library("sqldf")

sourceData <- "./Irvine-MLR/household_power_consumption.txt"
fi = file(sourceData)
df <- sqldf("select * from fi where Date in ('2/2/2007','1/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

png("plot1.png", width=480, height=480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()