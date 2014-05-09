#Author Alexander Parij
png(file="plot4.png", width = 480, height = 480, units = "px"  )
par(mfrow = c(2,2)  )

big_data <-read.table('household_power_consumption.txt', sep=";", na.strings = "?",header = TRUE)
few_days <-subset(big_data,as.Date(Date, format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
few_days['times'] <- paste(few_days$Date , few_days$Time)

plot(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_active_power, type="n",xlab="",ylab="Global Active Power")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_active_power, type="l")

plot(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Voltage, type="n",xlab="datetime",ylab="Voltage")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Voltage, type="l")

plot(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Sub_metering_1, type="l")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Sub_metering_2, type="l", col = "red")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"),box.lwd = 0, bty="n" ) 

plot(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_reactive_power, type="n",xlab="datetime",ylab="Global_reactive_power")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_reactive_power, type="l")
dev.off()
