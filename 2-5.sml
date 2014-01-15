(*fun foldl f ans [] = ans
	| foldl f ans (a::l) = foldl f (f(a,ans)) l

fun foldr f ans [] = ans
	| foldr f ans (a::l) = f(a, foldr f ans l)*)

fun count f l =
	let
		fun foldfun (a,b) = 
			if f a then 1+b
			else b
	in
		foldr foldfun 0 l
	end

val test = count (fn x => x > 3) [1,2,3,4,5,6,7]