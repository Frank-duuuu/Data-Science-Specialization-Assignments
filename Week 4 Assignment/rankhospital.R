worst <- function(state, outcome) {
        if(!state %in% unique(rates$State))
                return('Invalid state!')
        if(!outcome %in% c('heart attack', 'heart failure', 'pneumonia'))
                return('Invalid outcome!')
        
        order_state <- hospital_sort(state, outcome)
        return(order_state[nrow(order_state), c(1,2)])
}

rankhospital <- function(state, outcome, num = "best") {
        if(num == 'best')
                return(best(state, outcome))
        if(num == 'worst')
                return(worst(state, outcome))
        else
                order_state <- hospital_sort(state, outcome)
                return(order_state[num, 1])
}