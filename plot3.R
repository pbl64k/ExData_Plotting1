# Assumes household_power_consumption.txt is in the working directory

epc <- read.table('./household_power_consumption.txt', sep = ';', header = T)

epc <- epc[epc$Date == '1/2/2007' | epc$Date == '2/2/2007',]

epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))

epc$datetime <- strptime(paste(epc$Date, epc$Time), format = '%d/%m/%Y %H:%M:%S')

plot(epc$datetime, epc$Sub_metering_1, pch = '',
     xlab = '',
     ylab = 'Energy sub metering',
     main = '')
lines(epc$datetime, epc$Sub_metering_1)
lines(epc$datetime, epc$Sub_metering_2, col = 'red')
lines(epc$datetime, epc$Sub_metering_3, col = 'blue')
legend('topright', 'top',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1)

dev.copy(png, filename = './plot3.png', width = 480, height = 480)
dev.off()
