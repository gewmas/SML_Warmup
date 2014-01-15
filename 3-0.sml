(*"Hello" => {a.txt}
"World" => {a.txt}
"test" => {a.txt, b.txt}
"a" => {b.txt}
"input" => {b.txt}*)

functor F(M: ORD_MAP where type Key.ord_key = string)
         (S: ORD_SET where type Key.ord_key = string) :>
sig
	val proc: string list -> S.set M.map
end
= 
struct
	fun proc filename_list = 
		let
			fun f ([], map) = map
				| f ((a::l), map) = 
					let
						val ins = TextIO.openIn a

						(*if word exist, insert filename to the set, else create a new Key-Value pair*)
						fun insertWord (w, tempmap)= case M.find(tempmap, w) of
							NONE => M.insert(tempmap, w, S.add(S.empty, a))
							| _ =>  M.insert(tempmap, w, S.add(Option.valOf(M.find(tempmap,w)), a))  

						fun helper(copt: char option, tempString: string, temp_map) =
						case copt of
					        NONE => ( 
					           	(*print(tempString^"\n");*)
					           	f(l, insertWord(tempString, temp_map))
					           	)
					       	| SOME(c) => (
					         		(*print("tempString is "^tempString^"\n");*)

					         		if Char.isSpace(c) then (
					         			(*print(tempString^"\n");*)
					         			(*print("tempString is "^tempString^"\n");*)
					         			helper(TextIO.input1 ins, "", insertWord(tempString, temp_map))
					         			)
					         		else (
					         			helper(TextIO.input1 ins, tempString^(Char.toString(c)), temp_map)
					         			)
					         	)
					in
						helper(TextIO.input1 ins, "", map)
					end		
		in
			f (filename_list, M.empty)
		end
end

(*structure StringSet = SplaySetFn(struct type ord_key = string val compare = String.compare end) *)
(*map:('a->'b)->'a list->'b list
	map f mylist*)
structure StringMap = SplayMapFn(struct type ord_key = string val compare = String.compare end)
structure StringSet = SplaySetFn(struct type ord_key = string val compare = String.compare end)
structure StringF = F(StringMap)(StringSet)
val resultMap = StringF.proc(["a.txt", "b.txt"])

(*Test*)
val map_items = StringMap.listItemsi(resultMap)
val set_Hello = StringSet.listItems(Option.valOf(StringMap.find(resultMap, "Hello")))
val set_World = StringSet.listItems(Option.valOf(StringMap.find(resultMap, "World")))
val set_a = StringSet.listItems(Option.valOf(StringMap.find(resultMap, "a")))
val set_test = StringSet.listItems(Option.valOf(StringMap.find(resultMap, "test")))
val set_input = StringSet.listItems(Option.valOf(StringMap.find(resultMap, "input")))

(*
Reference
TextIO - http://www.cs.cornell.edu/courses/cs312/2006fa/recitations/rec09.html
TextIO Ref - http://www.itu.dk/~sestoft/mosmllib/TextIO.html
*)

