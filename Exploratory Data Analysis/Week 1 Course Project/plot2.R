png('plot2.png', width = 480, height = 480)
full_data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';'
                      , na.strings = '?')
data <- subset(full_data, Date %in% c('1/2/2007', '2/2/2007'))
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, plot(Global_active_power ~ Datetime, type = 'l', xlab = '', 
                ylab = 'Global Active Power (kilowatts)'))
dev.off()