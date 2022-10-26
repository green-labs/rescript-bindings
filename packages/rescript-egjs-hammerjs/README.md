# `rescript-egjs-hammerjs`

ReScript binding of [@egjs/hammerjs](https://github.com/naver/hammer.js)

## Install

```bash
npm i @greenlabs/rescript-egjs-hammerjs
or
yarn add @greenlabs/rescript-egjs-hammerjs
```

```json
"bs-dependencies": [
  "@greenlabs/rescript-egjs-hammerjs"
]
```

## Usage

```rescript
React.useEffect0(_ => {
    let swipeInstance =
      ref.current
      ->Js.Nullable.toOption
      ->Option.mapWithDefault(None, el => Some(el->HammerJs.makeWithElement))

    swipeInstance->Option.forEach(swipeInstance' =>
      HammerJs.on(
        swipeInstance',
        #swipe,
        event => {
          Js.log(event)
        },
      )
    )

    Some(
      _ => {
        swipeInstance->Option.forEach(swipeInstance' => swipeInstance'->HammerJs.destroy)
      },
    )
  })
```
