div := Number getSlot("/")
Number / := method(d, if(d == 0, return 0, return self div(d)))
