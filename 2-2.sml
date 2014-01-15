
(*fun foldl f ans [] = ans
	|foldl f ans (a::l) = foldl f (f(a,ans)) l*)

(*fun foldr f ans [] = ans
	| foldr f ans (a::l) = f(a, foldr f ans l)*)

(*fun flatten [] = []
  | flatten ([]::xs) = flatten xs
  | flatten ((x::xs)::ys) = x::(flatten (xs::ys));*)

(*[[1,2,3],[4],[],[5,6]] => [1,2,3,4,5,6]*)

fun flatten doublelist = 
		let
			fun f (a, []) = a
				| f ([], l) = l
				| f ((a::b), c) = a::f(b,c)
		in
			foldr f [] doublelist
		end

val test = flatten [[1,2,3],[4],[5,6],[],[7]]