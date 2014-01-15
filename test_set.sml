structure StringSet = SplaySetFn(struct type ord_key = string val compare = String.compare end)

val set = StringSet.add(StringSet.empty, "hello world")
val find = StringSet.find (fn "hello worlds"=>true | _ => false) set