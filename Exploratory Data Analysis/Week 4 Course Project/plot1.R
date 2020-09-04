PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

ALLsum <- aggregate(Emissions ~ year, PM, sum)

png('plot1.png', width = 480, height = 480, units = 'px', bg = 'transparent')

barplot(ALLsum$Emissions / 10 ^ 6, names.arg = ALLsum$year, xlab = 'Year', ylab = 'PM2.5 Emissions (10^6 tons)', 
        main = 'Total PM2.5 Emissions From All US Sources')

dev.off()