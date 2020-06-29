hospital_sort <- function(state, outcome) {
        
        rates[rates == 'Not Available'] <- 0
        indeice <- c(grep("^Hospital.*Death*", names(rates)))
        mortality_rates <- rates[, c(2, 7, indeice)]
        names(mortality_rates)[3:5] <- c('heart attack', 'heart failure', 'pneumonia')
        
        
        mortality_rates[, 3:5] <- apply(mortality_rates[, 3:5], 2, as.numeric)
        
        mortality_rates[mortality_rates == 0] <- NA
        selected_state <- mortality_rates[mortality_rates$State == state,]
        
        order_state <- arrange(selected_state, selected_state[, outcome], Hospital.Name)
        order_state <- order_state[complete.cases(order_state[, outcome]), ]
        return(order_state)
}

best <- function(state, outcome) {
        if(!state %in% unique(rates$State))
                return("Invalid state!")
        if(!outcome %in% c('heart attack', 'heart failure', 'pneumonia'))
                return('Invalid outcome!')
        
        order_state <- hospital_sort(state, outcome)
        return(order_state[1, c(1, 2)])
}
