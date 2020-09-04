PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

BaltimorePM <- PM[PM$fips == '24510', ]

BaltimoreSum <- aggregate(Emissions ~ year, BaltimorePM, sum)

png('plot2.png', width = 480, height = 480, units = 'px', bg = 'transparent')

barplot(BaltimoreSum$Emissions, names.arg = BaltimoreSum$year, xlab = 'Year', 
        ylab = 'PM2.5 Emissions (tons)', 
        main = 'Total PM2.5 Emissions From All Baltimore City Sources')

dev.off()