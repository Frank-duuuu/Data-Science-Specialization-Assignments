complete <- function(directory, id = 1:332) {
        full_files <- list.files(directory, full.names = TRUE)
        dat = data.frame()
        for(i in id) {
                temp <- read.csv(full_files[i])
                temp <- na.omit(temp)
                num <- nrow(temp)
                dat <- rbind(dat, data.frame('id' = i, 'nobs' = num))
        }
        return(dat)
}