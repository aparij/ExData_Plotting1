#Author Alexander Parij
png(file="plot1.png", width = 480, height = 480, units = "px"  )
big_data <-read.table('household_power_consumption.txt', sep=";", na.strings = "?",header = TRUE)
few_days <-subset(big_data,as.Date(Date, format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
hist(few_days$Global_active_power,xlab="Global Active Power (killowats)", col="red" , main = "Global Active Power" , ylim=c(0,1300))
dev.off()
