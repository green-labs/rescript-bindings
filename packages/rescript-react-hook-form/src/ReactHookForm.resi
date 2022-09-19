module Validation: {
  @unboxed @unboxed type rec t<'a> = Any('a): t<'a>
  let sync: ('a => option<string>) => t<'a => option<string>>
  let async: ('a => Js.Promise.t<option<string>>) => t<'a => Js.Promise.t<option<string>>>
}
module Rules: {
  type errorMessage<'a> = {value: 'a, message: string}
  @unboxed @unboxed type rec t<'b> = Any('a): t<'b>
  type config<'a, 'b> = {
    required?: bool,
    maxLength?: int,
    minLength?: int,
    max?: int,
    min?: int,
    pattern?: Js.Re.t,
    valueAsNumber?: bool,
    valueAsDate?: bool,
    onChange?: ReactEvent.Form.t => unit,
    onBlur?: ReactEvent.Focus.t => unit,
    validate?: Js.Dict.t<Validation.t<'a>>,
    disabled?: bool,
    shouldUnregister?: bool,
    setValueAs?: 'b => 'a,
  }
  type configWithErrorMessage<'a, 'b> = {
    required?: errorMessage<bool>,
    maxLength?: errorMessage<int>,
    minLength?: errorMessage<int>,
    max?: errorMessage<int>,
    min?: errorMessage<int>,
    pattern?: errorMessage<Js.Re.t>,
    valueAsNumber?: bool,
    valueAsDate?: bool,
    onChange?: ReactEvent.Form.t => unit,
    onBlur?: ReactEvent.Focus.t => unit,
    validate?: Js.Dict.t<Validation.t<'a>>,
    disabled?: bool,
    shouldUnregister?: bool,
    setValueAs?: 'b => 'a,
  }
  let empty: unit => t<'a>
  let make: config<'a, 'b> => t<'c>
  let makeWithErrorMessage: configWithErrorMessage<'a, 'b> => t<'c>
  let merge: (t<'a>, option<t<'a>>) => t<'b>
}
module Register: {
  type t = {
    onChange: ReactEvent.Form.t => unit,
    onBlur: ReactEvent.Focus.t => unit,
    ref: ReactDOM.domRef,
    name: string,
  }
}
module UnRegister: {
  type config = {
    keepDirty?: bool,
    keepTouched?: bool,
    keepIsValid?: bool,
    keepError?: bool,
    keepValue?: bool,
    keepDefaultValue?: bool,
  }
}
module Error: {
  type t = {message: string, @as("type") type_: string}
}
type formState = {
  errors: Js.Dict.t<Error.t>,
  isDirty: bool,
  dirtyFields: Js.Dict.t<bool>,
  touchedFields: Js.Dict.t<bool>,
  isSubmitted: bool,
  isSubmitting: bool,
  isSubmitSuccessful: bool,
  isValid: bool,
  isValidating: bool,
  submitCount: int,
}
type fieldState = {isDirty: bool, isTouched: bool, invalid: bool, error: option<Error.t>}
module type CreateFormInputConfig = {
  type t
  let name: string
  let config: Rules.t<t>
}
module Make: (
  Form: {
    type t
  },
) =>
{
  type resolverReturn = {values: Form.t, errors: Js.Dict.t<Error.t>}
  type config = {
    defaultValues: Form.t,
    mode?: [#onChange | #onBlur | #onSubmit | #onTouched | #all],
    reValidateMode?: [#onChange | #onBlur | #onSubmit],
    criteriaMode?: [#firstError | #all],
    shouldFocusError?: bool,
    delayError?: int,
    shouldUnregister?: bool,
    shouldUseNativeValidation?: bool,
    resolver?: Form.t => resolverReturn,
  }
  let createResolverFromResult: (
    Form.t => Belt.Result.t<Form.t, Js.Dict.t<Error.t>>,
    Form.t,
  ) => resolverReturn
  type t
  type control
  @send external clearErrors: t => unit = "clearErrors"
  @send external trigger: t => Js.Promise.t<unit> = "trigger"
  @get external formState: t => formState = "formState"
  @module("react-hook-form")
  external use: (~config: config) => t = "useForm"
  type onSubmit = ReactEvent.Form.t => unit
  @send
  external handleSubmit: (t, (@uncurry Form.t, ReactEvent.Form.t) => unit) => onSubmit =
    "handleSubmit"
  @send
  external handleSubmitWithError: (
    t,
    (@uncurry Form.t, ReactEvent.Form.t) => unit,
    (@uncurry 'a, ReactEvent.Form.t) => unit,
  ) => onSubmit = "handleSubmit"
  @send
  external getValues: t => Form.t = "getValues"
  @send
  external reset: (t, Form.t) => unit = "reset"
  module MakeInput: (T: CreateFormInputConfig) =>
  {
    type watchOption = {control: control, name: string}
    let makeRule: Rules.config<T.t, 'b> => Rules.t<'a>
    let makeRuleWithErrorMEssage: Rules.configWithErrorMessage<T.t, 'b> => Rules.t<'a>
    let useWatch: t => T.t
    let watch: t => T.t
    let getValue: t => T.t
    let setValue: (t, T.t) => unit
    let setValueWithOption: (
      t,
      T.t,
      ~shouldValidate: bool=?,
      ~shouldDirty: bool=?,
      ~shouldTouch: bool=?,
      unit,
    ) => unit
    let resetField: t => unit
    let setError: (t, Error.t) => unit
    let setErrorShouldFocus: (t, Error.t) => unit
    let createError: (string, string) => (string, Error.t)
    let focus: t => unit
    let focusShouldSelect: t => unit
    let getFieldState: t => fieldState
    let error: t => option<Error.t>
    let isDirty: t => bool
    let isTouched: t => bool
    let invalid: t => bool
    let clearError: t => unit
    let trigger: t => Js.Promise.t<unit>
    let unregister: (t, UnRegister.config) => unit
    type field = {
      name: string,
      onBlur: unit => unit,
      onChange: T.t => unit,
      value: T.t,
      ref: ReactDOM.domRef,
    }
    type render = {field: field, fieldState: fieldState, formState: formState}
    let renderController: (
      t,
      render => React.element,
      ~defaultValue: T.t=?,
      ~rules: Rules.t<T.t>=?,
      ~shouldUnregister: bool=?,
      unit,
    ) => React.element
    let useController: (t, ~rules: Rules.t<T.t>=?, ~shouldUnregister: bool=?, unit) => render
    let triggerWithFocus: t => Js.Promise.t<unit>
    let register: (t, ~config: Rules.t<T.t>=?, unit) => Register.t
    let renderWithRegister: (t, React.element, ~config: Rules.t<T.t>=?, unit) => React.element
  }
  module MakeInputArray: (
    T: {
      type t
      let name: string
      let config: Rules.t<array<t>>
    },
  ) =>
  {
    type watchOption = {control: control, name: string}
    let makeRule: Rules.config<array<T.t>, 'b> => Rules.t<'a>
    let makeRuleWithErrorMEssage: Rules.configWithErrorMessage<array<T.t>, 'b> => Rules.t<'a>
    let useWatch: t => array<T.t>
    let watch: t => array<T.t>
    let getValue: t => array<T.t>
    let setValue: (t, array<T.t>) => unit
    let setValueWithOption: (
      t,
      array<T.t>,
      ~shouldValidate: bool=?,
      ~shouldDirty: bool=?,
      ~shouldTouch: bool=?,
      unit,
    ) => unit
    let resetField: t => unit
    let setError: (t, Error.t) => unit
    let setErrorShouldFocus: (t, Error.t) => unit
    let createError: (string, string) => (string, Error.t)
    let focus: t => unit
    let focusShouldSelect: t => unit
    let getFieldState: t => fieldState
    let error: t => option<Error.t>
    let isDirty: t => bool
    let isTouched: t => bool
    let invalid: t => bool
    let clearError: t => unit
    let trigger: t => Js.Promise.t<unit>
    let unregister: (t, UnRegister.config) => unit
    type field = {
      name: string,
      onBlur: unit => unit,
      onChange: array<T.t> => unit,
      value: array<T.t>,
      ref: ReactDOM.domRef,
    }
    type render = {field: field, fieldState: fieldState, formState: formState}
    let renderController: (
      t,
      render => React.element,
      ~defaultValue: array<T.t>=?,
      ~rules: Rules.t<array<T.t>>=?,
      ~shouldUnregister: bool=?,
      unit,
    ) => React.element
    let useController: (t, ~rules: Rules.t<array<T.t>>=?, ~shouldUnregister: bool=?, unit) => render
    let triggerWithFocus: t => Js.Promise.t<unit>
    let register: (t, ~config: Rules.t<array<T.t>>=?, unit) => Register.t
    let renderWithRegister: (
      t,
      React.element,
      ~config: Rules.t<array<T.t>>=?,
      unit,
    ) => React.element
    type useFieldArrayOption = {control: control, name: string}
    type t2
    @get external id: T.t => string = "id"
    @get external fields: t2 => array<T.t> = "fields"
    @send external append: (t2, T.t) => unit = "append"
    @send external appendMany: (t2, array<T.t>) => unit = "append"
    @send external prepend: (t2, T.t) => unit = "prepend"
    @send external prependMany: (t2, array<T.t>) => unit = "prepend"
    @send external insert: (t2, int, T.t) => unit = "insert"
    @send external insertMany: (t2, int, array<T.t>) => unit = "insert"
    @send external swap: (t2, int, int) => unit = "swap"
    @send external move: (t2, int, int) => unit = "move"
    @send external update: (t2, int, T.t) => unit = "update"
    @send external replace: (t2, array<T.t>) => unit = "replace"
    @send external remove: (t2, int) => unit = "remove"
    @send external removeAll: t2 => unit = "removeAll"
    let useFieldArray: (t, ~config: Rules.t<array<T.t>>=?, unit) => t2
    let registerWithIndex: (
      t,
      int,
      ~config: Rules.t<array<T.t>>=?,
      ~property: string=?,
      unit,
    ) => Register.t
    let renderWithIndexRegister: (
      t,
      int,
      React.element,
      ~property: string=?,
      ~config: Rules.t<array<T.t>>=?,
      unit,
    ) => React.element
  }
  module Context: {
    @module("react-hook-form")
    external use: unit => t = "useFormContext"
  }
  module Provider: {
    @react.component
    let make: (~children: React.element, ~methods: t) => React.element
  }
}
