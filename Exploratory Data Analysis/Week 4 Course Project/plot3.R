PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

BaltimorePM <- PM[PM$fips == '24510', ]

BaltimoreSum <- aggregate(Emissions ~ year, BaltimorePM, sum)

png('plot3.png', width = 480, height = 480, units = 'px', bg = 'transparent')

library(ggplot2)
plot3 <- ggplot(BaltimorePM, aes(factor(year), Emissions, fill = type)) + 
        geom_bar(stat = 'identity') + 
        theme_bw() + guides(fill = FALSE) + 
        facet_grid(. ~ type, scales = 'free', space = 'free') + 
        labs(x = 'Year', y = expression('Total PM'[2.5] * ' Emissions (tons)')) + 
        labs(title = expression('PM'[2.5] * ' Emissions, Baltimore City 1999-2008 by source type'))
print(plot3)

dev.off()