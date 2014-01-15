(*0, 1, 1, 2, 3, 5*)
fun fib n = case n of
	0 => 0
	| 1 => 1
	| x => fib(x-1) + fib(x-2)


fun test n = 
	if n >= 0 then (test(n-1); print(Int.toString(fib n)^"\n"))
	else ()

val f = test 10