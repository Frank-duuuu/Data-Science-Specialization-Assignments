library(ggplot2)
activity <- read.csv('activity.csv')
activity$date <- as.POSIXct(activity$date, '%Y-%m-%d')
weekday <- weekdays(activity$date)
activity <- cbind(activity, weekday)

summary(activity)

total_steps <- with(activity, aggregate(steps, by = list(date), FUN = sum, na.rm = TRUE))
names(total_steps) <- c('date', 'steps')

hist(total_steps$steps, main = 'Total Number of Steps Taken Per Day', xlab = 'Total steps taken per day', col = 'darkblue', ylim = c(0, 20), breaks = seq(0, 25000, by = 2500))

mean(total_steps$steps)

median(total_steps$steps)

daily_average <- aggregate(activity$steps, by = list(activity$interval), FUN = mean, na.rm = TRUE)
names(daily_average) <- c('interval', 'mean')
plot(daily_average$interval, daily_average$mean, type = 'l', col = 'darkblue', lwd = 2, xlab = 'Interval', ylab = 'Average number of steps', main = 'Average Number of Steps Per Interval')

daily_average[which.max(daily_average$mean),]$interval

sum(is.na(activity$steps))

imputed_data <- daily_average$mean[match(daily_average$interval, activity$interval)]

activity_imputed <- transform(activity, steps = ifelse(is.na(activity$steps), yes = imputed_data, no = activity$steps))

total_steps_imputed <- aggregate(steps ~ date, activity_imputed, sum)
names(total_steps_imputed) <- c('date', 'daily_steps')
hist(total_steps_imputed$daily_steps, col = "darkblue", xlab = "Total steps per day", ylim = c(0,30), main = "Total Number of Steps Taken Per Day", breaks = seq(0,25000,by=2500))

mean(total_steps_imputed$daily_steps)

median(total_steps_imputed$daily_steps)

activity$date <- as.Date(strptime(activity$date, format="%Y-%m-%d"))
activity$datetype <- sapply(activity$date, function(x) {
        if (weekdays(x) == "Saturday" | weekdays(x) =="Sunday") 
        {y <- "Weekend"} else 
        {y <- "Weekday"}
        y
})

activity_by_date <- aggregate(steps~interval + datetype, activity, mean, na.rm = TRUE)
plot<- ggplot(activity_by_date, aes(x = interval , y = steps, color = datetype)) +
        geom_line() +
        labs(title = "Average Daily Steps by Types of Dates", x = "Interval", y = "Average number of steps") +
        facet_wrap(~ datetype, ncol = 1, nrow=2)
print(plot)