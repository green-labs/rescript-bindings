# `rescript-testing-library`

## Install

```bash
npm i @greenlabs/rescript-testing-library --dev
or
yarn add @greenlabs/rescript-testing-library --dev
```

```json
"bs-dev-dependencies": [
  "@greenlabs/rescript-testing-library"
]
```

## Usage

```rescript
module TestComponent = {
  @react.component
  let make = () => {
    let (show, setShow) = React.useState(_ => false)
    <div>
      <button type_="button" onClick={_ => setShow(prev => !prev)}>
        {`Toggle`->React.string}
      </button>
      {show ? <h1 title="my_title"> {`Hello World`->React.string} </h1> : React.null}
    </div>
  }
}

open! Jest
open! Expect
open! TestingLibrary.JestExpect
open! TestingLibrary.Dom

module Event = TestingLibrary.Event

testPromise("use jest dom", async () => {
  let userEvent = Event.setup()

  TestingLibrary.React.render(<TestComponent />)->ignore

  expect(screen->ByTitle.query("my_title"))->not->toBeInTheDocument
  await TestingLibrary.React.actPromise(async () => {
    await (userEvent->Event.click(screen->ByText.get("Toggle")))
  })
  expect(screen->ByTitle.get("my_title")->Some)->toBeInTheDocument
})
```
