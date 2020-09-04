PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

vehicles <- grepl('vehicle', SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesPM <- PM[PM$SCC %in% vehiclesSCC,]
BaltimoreVehiclesPM <- vehiclesPM[vehiclesPM$fips == '24510',]

png('plot5.png', width = 480, height = 480, units = 'px', bg = 'transparent')

library(ggplot2)
plot5 <- ggplot(BaltimoreVehiclesPM, aes(factor(year), Emissions)) + 
        geom_bar(stat = 'identity', fill = 'grey', width = 0.75) + 
        theme_bw() + guides(fill = FALSE) + 
        labs(x = 'Year', y = expression('PM'[2.5] * ' Emissions (10^5 tons)')) + 
        labs(title = expression('PM'[2.5] * ' Motor Vehicle Source Emissions in Baltimore From 1999-2008'))

print(plot5)

dev.off()