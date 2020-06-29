rankhospital <- function(state, outcome, num = "best", st = "a"){
        if (num == "best")
                return(best(state,outcome))
        if (num == "worst")
                return(worst(state,outcome))       
        else {order_state <- hospital_sort(state,outcome) 
        return(order_state[num,c(1,2)])}
}

rankall <- function(outcome, num = "best") { 
        if(!outcome %in% c('heart attack', 'heart failure', 'pneumonia'))
                return('Invalid outcome!')
        
        states <- sort(unique(rates[, 7]))
        mat <- matrix(, nrow = 0, ncol = 2)
        
        for(i in (1:length(states))) {
                out <- matrix(rankhospital(states[i], outcome, num), ncol = 2)
                mat <- rbind(mat, out)
        }
        colnames(mat) <- c('Hospital.Name', 'State')
        mat
}