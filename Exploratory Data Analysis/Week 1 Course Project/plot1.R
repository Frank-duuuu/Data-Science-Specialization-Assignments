png('plot1.png', width = 480, height = 480)
full_data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';'
                      , na.strings = '?')
data <- subset(full_data, Date %in% c('1/2/2007', '2/2/2007'))
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

hist(data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'
     , ylab = 'Frequency', col = 'red')
dev.off()