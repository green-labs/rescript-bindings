type debounceOptions<'a> = {
  maxWait?: int,
  leading?: bool,
  trailing?: bool,
  equalityFn?: (. 'a, 'a) => bool,
}

type debouncedReturn<'a> = {@as("0") value: 'a} // TODO: add second position

/**
```rescript
let debounced = useDebounce(someValue, 500)
debounced.value->Js.log
````
*/
@module("use-debounce")
external useDebounce: ('a, int) => debouncedReturn<'a> = "useDebounce"

@module("use-debounce")
external useDebounceWithOptions: ('a, int, debounceOptions<'a>) => debouncedReturn<'a> =
  "useDebounce"

type debounceCallbackOptions = {
  maxWait?: int,
  leading?: bool,
  trailing?: bool,
}

@module("use-debounce")
external useDebouncedCallbackOriginal: ('a, int, ~options: debounceCallbackOptions=?) => 'a =
  "useDebouncedCallback"

// FIXME: flush()'s type signature is `unit => ReturnType<callback>`, but couldn't find a way
// to achieve it in ReScript so left the return type as unit.
type methods = {cancel: unit => unit, isPending: unit => int, flush: unit => unit}
%%private(external getMethods: 'a => methods = "%identity")

/**
```rescript
let (debouncedCallback, _debouncedCallbackMethods) = useDebouncedCallback(e => {
  e->ReactEvent.Synthetic.preventDefault
}, 500, ~options={maxWait: 500})
<input onClick={debouncedCallback} />
````
*/
let useDebouncedCallback = (callback, timeout, ~options) => {
  let deboucedCallback = useDebouncedCallbackOriginal(callback, timeout, ~options)
  (deboucedCallback, getMethods(deboucedCallback))
}

type throttleCallbackOptions = {
  leading?: bool,
  trailing?: bool,
}

@module("use-debounce")
external useThrottledCallbackOriginal: ('a, int, ~options: throttleCallbackOptions=?) => 'a =
  "useThrottledCallback"

let useThrottledCallback = (callback, timeout, ~options) => {
  let throttledCallback = useThrottledCallbackOriginal(callback, timeout, ~options)
  (throttledCallback, getMethods(throttledCallback))
}
