PM <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

combustionRelated <- grepl('comb', SCC$SCC.Level.One, ignore.case = TRUE)
coalRelated <- grepl('coal', SCC$SCC.Level.Four, ignore.case = TRUE)
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionPM <- PM[PM$SCC %in% combustionSCC,]

png('plot4.png', width = 480, height = 480, units = 'px', bg = 'transparent')

library(ggplot2)
plot4 <- ggplot(combustionPM, aes(factor(year), Emissions/10^5)) + 
        geom_bar(stat = 'identity', fill = 'grey', width = 0.75) + 
        theme_bw() + guides(fill = FALSE) + 
        labs(x = 'Year', y = expression('PM'[2.5] * ' Emissions (10^5 tons)')) + 
        labs(title = expression('PM'[2.5] * ' Coal Combustion Source Emssions Across US From 1999-2008'))
print(plot4)

dev.off()