PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

vehicles <- grepl('vehicle', SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesPM <- PM[PM$SCC %in% vehiclesSCC,]

BaltimoreVehiclesPM <- vehiclesPM[vehiclesPM$fips == '24510',]
BaltimoreVehiclesPM$city <- 'Baltimore City'

LAvehiclesPM <- vehiclesPM[vehiclesPM$fips == '06037',]
LAvehiclesPM$city <- 'Los Angeles County'

bothPM <- rbind(BaltimoreVehiclesPM, LAvehiclesPM)

png('plot6.png', width = 480, height = 480, units = 'px', bg = 'transparent')

library(ggplot2)
plot6 <- ggplot(bothPM, aes(factor(year), Emissions, fill = city)) + 
        geom_bar(aes(fill = year), stat = 'identity') + 
        facet_grid(. ~ city, scales = 'free', space = 'free') + 
        theme_bw() + guides(fill = FALSE) + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
print(plot6)

dev.off()