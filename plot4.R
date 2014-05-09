# Assumes household_power_consumption.txt is in the working directory

epc <- read.table('./household_power_consumption.txt', sep = ';', header = T)

epc <- epc[epc$Date == '1/2/2007' | epc$Date == '2/2/2007',]

epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))

epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))

epc$Voltage <- as.numeric(as.character(epc$Voltage))

epc$Global_reactive_power <-
    as.numeric(as.character(epc$Global_reactive_power))

epc$datetime <- strptime(paste(epc$Date, epc$Time),
                         format = '%d/%m/%Y %H:%M:%S')

# Apparently we need to plot directly to PNG device for the legend to render
# properly.
png(filename = './plot4.png', width = 480, height = 480)

par(mfcol=c(2, 2))

plot(epc$datetime, epc$Global_active_power, pch = '',
     xlab = '',
     ylab = 'Global Active Power',
     main = '')
lines(epc$datetime, epc$Global_active_power)

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
       border = 'white',
       lwd = 1)

plot(epc$datetime, epc$Voltage, pch = '',
     xlab = 'datetime',
     ylab = 'Voltage',
     main = '')
lines(epc$datetime, epc$Voltage)

plot(epc$datetime, epc$Global_reactive_power, pch = '',
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     main = '')
lines(epc$datetime, epc$Global_reactive_power)

dev.off()
