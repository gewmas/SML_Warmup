datatype expr =
	NUM of int
	| PLUS of expr * expr
	| MINUS of expr * expr
	| TIMES of expr * expr
	| DIV of expr * expr
	| F of expr list * (int list -> int)

fun eval (NUM n) = n
  	| eval (PLUS (e1, e2)) =
    let
		val n1 = eval e1
		val n2 = eval e2
    in
		n1+n2
    end
    | eval (MINUS (e1, e2)) =
    let
		val n1 = eval e1
		val n2 = eval e2
    in
		n1-n2
    end
    | eval (TIMES (e1, e2)) =
    let
		val n1 = eval e1
		val n2 = eval e2
    in
		n1*n2
    end
    | eval (DIV (e1, e2)) =
    let
		val n1 = eval e1
		val n2 = eval e2
    in
		n1 div n2
    end
    | eval (F (exprlist, f)) =
    let
    	fun map f [] = []
    		| map f (a::l) = (f a)::(map f l)
    	val evalresult = map eval exprlist (*Recursively evaluate all the exprs in their exprlist*)
    in
    	f evalresult (*Then apply their function to the resulting integers*)
    end

val testPlus = eval (PLUS(NUM 2, NUM 3))
val testMinus = eval (MINUS(NUM 2, NUM 3))
val testTimes = eval (TIMES(NUM 2, NUM 3))
val testDiv = eval (DIV(NUM 10, NUM 2))

fun sumlist [] = 0 | sumlist (a::l) = a + sumlist l
val testF = eval (F([NUM 1, MINUS(NUM 2, NUM 3)], sumlist))