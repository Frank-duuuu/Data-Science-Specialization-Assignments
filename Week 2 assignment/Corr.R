corr <- function(directory, threshold = 0) {
        full_files <- list.files(directory, full.names = TRUE)
        dat = vector(mode = 'numeric', length = 0)
        for(i in 1:length(full_files)) {
                temp <- read.csv(full_files[i])
                temp <- temp[complete.cases(temp),]
                num <- nrow(temp)
                if(num > threshold) {
                        dat <- c(dat, cor(temp$nitrate, temp$sulfate))
                }
        }
        return(dat)
}