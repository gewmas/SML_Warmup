(*fun foldl f ans [] = ans
	| foldl f ans (a::l) = foldl f (f(a,ans)) l

fun foldr f ans [] = ans
	| foldr f ans (a::l) = f(a, foldr f ans l)*)

fun map f l = 
	let
		fun foldfun (a,b) = (f a)::b
	in
		foldr foldfun [] l
	end

val test_map = map (fn x => x * x) [1,2,3,4,5,6]