# `rescript-react-hook-form`

## Install

```bash
npm i @greenlabs/rescript-react-hook-form
or
yarn add @greenlabs/rescript-react-hook-form
```

```json
"bs-dependencies": [
  "@greenlabs/rescript-react-hook-form"
]
```

## Usage

### Define module

```rescript
type input = {
  id: string,
  password: string,
  hobbys: array<hobby>,
} and hobby = {value: string}

module Form = HookForm.Make({
  type t = input
})

module FormInput = {
  module Id = Form.Input({
    type t = string
    let name = "id"
    let config = HookForm.Rules.make({
      required: true,
    })
  })

  module Password = Form.Input({
    type t = string
    let name = "password"
    let config = HookForm.Rules.make({
      required: true,
    })
  })

  module Hobbies = Form.InputArray({
    type t = hobby
    let name = "hobbies"
    let config = HookForm.Rules.empty()
  })
}
```

### Example

```rescript
@react.component
let make = () => {
  let form = Form.use()
  let hobbies = FormInput.Hobbies.use(form, ())

  let formState = form->Form.formState
  let isValid = formState.isValid

  let handleClearPassword = _ => {
    form->FormInput.Password.setValue("")
  }

  let handleAddHubby = _ => {
    hobbies->FormInput.Hobbies.append({
      value: `요리`,
    })
  }

  React.useEffect0(() => {
    form->FormInput.Id.focus
    None
  })

  <form onSubmit={form->Form.handleSubmit(input => {
    Js.log((input.id, input.password, input.hobbies))
  })}>
    <label>
      {form->FormInput.Id.renderWithRegister(<input placeholder="id" type_="text" />)}
    </label>
    {form
    ->FormInput.Id.error
    ->Option.mapWithDefault(React.null, error => {
      <p> {error.message->React.string} </p>
    })}
    <label>
      {form->FormInput.Password.renderWithRegister(
        <input placeholder="password" type_="password" />,
      )}
    </label>
    {form
    ->FormInput.Password.error
    ->Option.mapWithDefault(React.null, error => {
      <p> {error.message->React.string} </p>
    })}
    {hobbys
    ->FormInput.Hobbies.fields
    ->Array.mapWithIndex((index, field) => {
      <div key={field->FormInput.Hobbies.id}>
        {form->FormInput.Hobbies.renderWithIndexRegister(
          index,
          <input type_="text" />,
          ~property="value",
          (),
        )}
        <p> {`Current value: ${field.value}`->React.string} </p>
      </div>
    })
    ->React.array}
    <button type_="button" onClick={handleAddHubby}> {`Add new hubby`->React.string} </button>
    <button type_="button" onClick={handleClearPassword}>
      {`Clear password`->React.string}
    </button>
    <button disabled={!isValid} type_="submit"> {`Ok`->React.string} </button>
  </form>
}
```