fun squareList l =
	let
		fun map f [] = []
			| map f (a::l) = (f a)::(map f l)
	in
		map (fn x => x*x) l
	end

val test = squareList [2,5,1,3]