# Assumes household_power_consumption.txt is in the working directory

epc <- read.table('./household_power_consumption.txt', sep = ';', header = T)

epc <- epc[epc$Date == '1/2/2007' | epc$Date == '2/2/2007',]

epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))

epc$datetime <- strptime(paste(epc$Date, epc$Time), format = '%d/%m/%Y %H:%M:%S')

plot(epc$datetime, epc$Global_active_power, pch = '',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)',
     main = '')
lines(epc$datetime, epc$Global_active_power)

dev.copy(png, filename = './plot2.png', width = 480, height = 480)
dev.off()
