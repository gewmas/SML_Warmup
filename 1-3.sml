(*0, 1 are not prime*)
fun isPrime x = 
	let
		fun checkPrime n =
			if n = 1 then true
			else 
				if n = x then checkPrime(n-1)
				else 
					if (x mod n) = 0 then false
					else checkPrime(n-1)
	in
		if x <= 1 then false
		else checkPrime x
	end

fun isPrimeToString boolean =
	if boolean = true then " is"
	else " is not"

fun test n =
	if n >= 0 then (
		test(n-1);
		print(Int.toString(n)^isPrimeToString(isPrime n)^" prime\n")
	)
	else (print("Negative Number Not Allow.\n"))

val f = test 21