pollutantmean <- function(directory, pollutant, id = 1:332) {
        full_files <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        for(i in id) {
                temp <- read.csv(full_files[i])
                dat <- rbind(dat, temp)
        }
        mean(dat[,pollutant], na.rm = TRUE)
}