(*
fun foldl f ans [] = ans
	| foldl f ans (a::l) = foldl f (f(a,ans)) l

fun foldr f ans [] = ans
	| foldr f ans (a::l) = f(a, foldr f ans l)

datatype 'a option =
	SOME of 'a
	| NONE
*)

fun mapPartial f l =
	let
		fun foldfun (a,ans) =
			case f a of
				NONE => ans
				| SOME a=> a::ans
	in
		foldr foldfun [] l
	end

val test = mapPartial (fn x => case x > 3 of
	true => SOME(x)
	| false => NONE) [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1]