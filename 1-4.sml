fun sumList [] = 0
	| sumList (a::l) = a + sumList l

val test1 = sumList [1,2,3,4,5]
val test2 = sumList [~1,0,1]