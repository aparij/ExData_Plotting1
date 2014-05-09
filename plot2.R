#Author Alexander Parij
png(file="plot2.png", width = 480, height = 480, units = "px"  )
big_data <-read.table('household_power_consumption.txt', sep=";", na.strings = "?",header = TRUE)
few_days <-subset(big_data,as.Date(Date, format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
few_days['times'] <- paste(few_days$Date , few_days$Time)
plot(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_active_power, type="n",xlab="",ylab="Global Active Power (killowats)")
lines(strptime(few_days$times, "%d/%m/%Y %H:%M:%OS"),few_days$Global_active_power, type="l")
dev.off()
