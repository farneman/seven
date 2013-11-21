List mySum := method(
	total := 0
	call target foreach(i, v, if(v type == "Number", total = total + v, if(v type == "List", total = total + v mySum, Exception raise("Item is not a number"))))
	return total)

list(list(1, 1, 1), list(1, 1, 1), list(1, 1, 1)) mySum println

List myAverage := method(
	total := call target mySum
	total := total / call target size
	return total)

list(list(1, 1, 1), list(1, 1, 1), list(1, 1, 1)) myAverage println
list("a", "b") myAverage println
