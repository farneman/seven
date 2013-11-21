Fib := Object clone
Fib	fNum := 1
Fib	sNum := 0
Fib step := method(
	nNum := fNum + sNum
	fNum = sNum
	sNum = nNum)

Fib fibRecur := method(nth,
	Fib step
	if (nth != 1,
		nth = nth - 1
		fibRecur(nth),
		writeln(Fib sNum)))

/*Fib fibRecur(4)*/

Fib fibLoop := method(nth,
	for(i, 1, nth, 1, Fib step);
	writeln(Fib sNum))

/*Fib fibLoop(4)*/
