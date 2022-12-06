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
type rec input = {
  id: string,
  password: string,
  hobbies: array<hobby>,
}
and hobby = {value: string}

module Form = ReactHookForm.Make({
  type t = input
})

module FormInput = {
  module Id = Form.MakeInput({
    type t = string
    let name = "id"
    let config = ReactHookForm.Rules.make({
      required: true,
    })
  })

  module Password = Form.MakeInput({
    type t = string
    let name = "password"
    let config = ReactHookForm.Rules.make({
      required: true,
    })
  })

  module Hobbies = Form.MakeInputArray({
    type t = hobby
    let name = "hobbies"
    let config = ReactHookForm.Rules.empty()
  })
}
```

### Example

```rescript
@react.component
let make = () => {
  let form = Form.use(
    ~config={
      defaultValues: {id: "id", password: "", hobbies: []},
    },
  )
  let hobbies = FormInput.Hobbies.useFieldArray(form, ())

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

  <form
    onSubmit={form->Form.handleSubmit(input => {
      Js.log((input.id, input.password, input.hobbies))
      _ => ()
    })}>
    <label>
      {form->FormInput.Id.renderWithRegister(<input placeholder="id" type_="text" />, ())}
    </label>
    {form
    ->FormInput.Id.error
    ->Belt.Option.mapWithDefault(React.null, error => {
      <p> {error.message->React.string} </p>
    })}
    <label>
      {form->FormInput.Password.renderWithRegister(
        <input placeholder="password" type_="password" />,
        (),
      )}
    </label>
    {form
    ->FormInput.Password.error
    ->Belt.Option.mapWithDefault(React.null, error => {
      <p> {error.message->React.string} </p>
    })}
    {hobbies
    ->FormInput.Hobbies.fields
    ->Belt.Array.mapWithIndex((index, field) => {
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
    <button type_="button" onClick={handleClearPassword}> {`Clear password`->React.string} </button>
    <button disabled={!isValid} type_="submit"> {`Ok`->React.string} </button>
  </form>
}
```
