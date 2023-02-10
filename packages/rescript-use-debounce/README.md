# `rescript-use-debounce`

Binding of [`use-debounce`](https://github.com/xnimorz/use-debounce) package

## Install

```bash
npm i @greenlabs/rescript-use-debounce
or
yarn add @greenlabs/rescript-use-debounce
```

```json
"bs-dependencies": [
  "@greenlabs/rescript-use-debounce"
]
```

## Usage

```rescript
let test = () => {
  let (debouncedCallback, debouncedCallbackMethods) = useDebouncedCallback(e => {
    e->ReactEvent.Synthetic.preventDefault
  }, 500, ~options={maxWait: 500})

  (debouncedCallback, debouncedCallbackMethods.isPending())
}
```

## Note

`flush()`'s type signature is `unit => ReturnType<callback>`, but couldn't find a way to achieve it in ReScript so left the return type as unit.
