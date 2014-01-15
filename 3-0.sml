(*"Hello" => {a.txt}
"World" => {a.txt}
"test" => {a.txt, b.txt}
"a" => {b.txt}
"input" => {b.txt}*)

signature MyMap = 
sig
	type key
	type 'a map
	val empty: 'a map
	(*val add: key * 'a * 'a map -> 'a map
	val find: key * 'a map -> 'a option*)
end

functor MyBst (K: ORD_KEY) : MyMap = 
struct
	type key = K.ord_key
	datatype 'a map = 
		NODE of key * 'a * 'a map * 'a
		| NIL
	val empty = NIL
end

structure IntBst = MyBst(struct type ord_key = int
								val compare = Int.compare
					end)
(*======*)
(*structure StringMap :> ORD_MAP where type Key.ord_key = string

end

structure StringSet :> ORD_SET where type Key.ord_key = string

end*)

functor F(M: ORD_MAP where type Key.ord_key = int)
         (S: ORD_SET where type Key.ord_key = int) :>
sig
	(*val proc: string list -> S.set M.map*)
	val proc: string list -> unit
end
= 
struct
	fun proc stringList =
		let
			val ins = TextIO.openIn "a.txt"
			fun helper(copt: char option, tempString: string) =
			case copt of
		           NONE => ( print(tempString^"\n") )
		         | SOME(c) => (
		         		print("tempString is "^tempString^"\n");

		         		if Char.isSpace(c) then (
		         			print(tempString^"\n");
		         			print("tempString is "^tempString^"\n");
		         			helper(TextIO.input1 ins, "")
		         			)
		         		else (

		         			helper(TextIO.input1 ins, tempString^(Char.toString(c)))
		         			)

		         		(*print("="^Char.toString(c)^"=\n");*)
		         		
		         		(*helper(TextIO.input1 ins, tempString^(Char.toString(c)))*)
		         	)
		in
			helper(TextIO.input1 ins, "")
		end
end

structure IntListF = F(IntListMap)(IntListSet)

val test = IntListF.proc(["a.txt", "b.txt"])


(*
Reference
TextIO - http://www.cs.cornell.edu/courses/cs312/2006fa/recitations/rec09.html
TextIO Ref - http://www.itu.dk/~sestoft/mosmllib/TextIO.html
*)

