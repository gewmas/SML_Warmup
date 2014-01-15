(*fun foldl f ans [] = ans
	| foldl f ans (a::l) = foldl f (f(a,ans)) l

fun foldr f ans [] = ans
	| foldr f ans (a::l) = f(a, foldr f ans l)*)

fun filter f l =
	let
		fun foldfun (a,b) = 
			if f a then a::b
			else b
	in
		foldr foldfun [] l
	end

val test1 = filter (fn x => x > 1) [1,2,3]
val test2 = filter (fn x => (x mod 2 = 0)) [1,2,3];