# Assumes household_power_consumption.txt is in the working directory

#epc <- read.table('./household_power_consumption.txt', sep = ';', header = T)

epc <- epc[epc$Date == '1/2/2007' | epc$Date == '2/2/2007',]

hist(as.numeric(as.character(epc$Global_active_power)),
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power',
     col = 'darkorange')

dev.copy(png, filename = './plot1.png', width = 480, height = 480)
dev.off()
