structure StringMap = SplayMapFn(struct type ord_key = string val compare = String.compare end)

val map = StringMap.insert(StringMap.empty, "key", "hello")
val findmap = StringMap.find(map, "key")