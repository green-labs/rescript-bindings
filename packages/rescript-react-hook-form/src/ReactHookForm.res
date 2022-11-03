module Validation = {
  @unboxed
  type rec t<'a> = Any('a): t<'a>
  let sync = (syncHandler: 'a => option<string>) => Any(syncHandler)
  let async = (asyncHandler: 'a => Js.Promise.t<option<string>>) => Any(asyncHandler)
}

module Rules = {
  type errorMessage<'a> = {value: 'a, message: string}

  @unboxed
  type rec t<'b> = Any('a): t<'b>

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

  let empty = () => Any(None)
  let make = (config: config<'a, 'b>) => Any(config)
  let makeWithErrorMessage = (config: configWithErrorMessage<'a, 'b>) => Any(config)
  let merge = (a: t<'a>, b: option<t<'a>>) => {
    Any(Js.Obj.empty()->Js.Obj.assign(a->Obj.magic)->Js.Obj.assign(b->Obj.magic))
  }
}

module Register = {
  type t = {
    onChange: ReactEvent.Form.t => unit,
    onBlur: ReactEvent.Focus.t => unit,
    ref: ReactDOM.domRef,
    name: string,
  }
}

module UnRegister = {
  type config = {
    keepDirty?: bool,
    keepTouched?: bool,
    keepIsValid?: bool,
    keepError?: bool,
    keepValue?: bool,
    keepDefaultValue?: bool,
  }
}

module Error = {
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

type fieldState = {
  isDirty: bool,
  isTouched: bool,
  invalid: bool,
  error: option<Error.t>,
}

module type CreateFormInputConfig = {
  type t
  let name: string
  let config: Rules.t<t>
}

module Make = (
  Form: {
    type t
  },
) => {
  type resolverReturn = {
    values: Form.t,
    errors: Js.Dict.t<Error.t>,
  }

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

  let createResolverFromResult = (
    resolver: Form.t => Belt.Result.t<Form.t, Js.Dict.t<Error.t>>,
    data: Form.t,
  ) => {
    let result = switch data->resolver {
    | Belt.Result.Ok(data') => {
        values: data',
        errors: Js.Dict.empty(),
      }
    | Belt.Result.Error(errors) => {
        values: data,
        errors,
      }
    }
    result
  }

  @ocaml.doc("`react-hook-form` UseFormReturn")
  type t
  type control

  @get external control: t => control = "control"
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

  @send
  external _register: (t, string, option<Rules.t<'a>>) => Register.t = "register"

  module MakeInput = (T: CreateFormInputConfig) => {
    type watchOption = {
      control: control,
      name: string,
    }

    let makeRule = (config: Rules.config<T.t, 'b>) => Rules.Any(config)
    let makeRuleWithErrorMessage = (config: Rules.configWithErrorMessage<T.t, 'b>) => Rules.Any(
      config,
    )

    @module("react-hook-form")
    external _useWatch: watchOption => T.t = "useWatch"
    let useWatch = (form: t) =>
      _useWatch({
        control: form->control,
        name: T.name,
      })

    @send external _watch: (t, string) => T.t = "watch"
    let watch = form => form->_watch(T.name)

    @send external _getValues: (t, string) => T.t = "getValues"
    let getValue = (form: t) => form->_getValues(T.name)

    @send
    external _setValue: (t, string, T.t, ~option: 'a=?, unit) => unit = "setValue"
    let setValue = (form, value) => form->_setValue(T.name, value, ())
    let setValueWithOption = (
      form,
      value,
      ~shouldValidate: option<bool>=?,
      ~shouldDirty: option<bool>=?,
      ~shouldTouch: option<bool>=?,
    ) =>
      form->_setValue(
        T.name,
        value,
        ~option={
          "shouldValidate": shouldValidate,
          "shouldDirty": shouldDirty,
          "shouldTouch": shouldTouch,
        },
      )

    @send external _resetField: (t, string) => unit = "resetField"
    let resetField = form => form->_resetField(T.name)

    @send external _setError: (t, string, Error.t) => unit = "setError"
    let setError = (form, error) => form->_setError(T.name, error)

    @send
    external _setErrorShouldFocus: (
      t,
      string,
      Error.t,
      @as(json`{ shouldFocus: true }`) _,
    ) => unit = "setError"
    let setErrorShouldFocus = (form, error) => form->_setErrorShouldFocus(T.name, error)

    let createError = (type_, message): (string, Error.t) => (
      T.name,
      {
        type_,
        message,
      },
    )

    @send external _setFocus: (t, string) => unit = "setFocus"
    let focus = form => form->_setFocus(T.name)

    @send
    external _setFocusShouldSelect: (t, string, @as(json`{ shouldSelect: true }`) _) => unit =
      "setFocus"
    let focusShouldSelect = form => form->_setFocusShouldSelect(T.name)

    @send
    external _getFieldState: (t, string, formState) => fieldState = "getFieldState"
    let getFieldState = form => form->_getFieldState(T.name, form->formState)

    let error = form => (form->getFieldState).error
    let isDirty = form => (form->getFieldState).isDirty
    let isTouched = form => (form->getFieldState).isTouched
    let invalid = form => (form->getFieldState).invalid

    @send external _clearError: (t, string) => unit = "clearErrors"
    let clearError = form => form->_clearError(T.name)

    @send external _trigger: (t, string) => Js.Promise.t<unit> = "trigger"
    let trigger = form => form->_trigger(T.name)

    @send external _unregister: (t, string, UnRegister.config) => unit = "unregister"
    let unregister = (form, config) => form->_unregister(T.name, config)

    type field = {
      name: string,
      onBlur: unit => unit,
      onChange: T.t => unit,
      value: T.t,
      ref: ReactDOM.domRef,
    }

    type render = {field: field, fieldState: fieldState, formState: formState}

    module Controller = {
      @module("react-hook-form") @react.component
      external make: (
        ~name: string,
        ~control: control,
        ~render: render => React.element,
        ~defaultValue: T.t=?,
        ~rules: Rules.t<'a>=?,
        ~shouldUnregister: bool=?,
      ) => React.element = "Controller"
    }

    let renderController = (
      form,
      render: render => React.element,
      ~defaultValue: option<T.t>=?,
      ~rules: option<Rules.t<T.t>>=?,
      ~shouldUnregister: option<bool>=?,
      (),
    ) => {
      <Controller
        name=T.name
        control={form->control}
        render
        ?defaultValue
        rules=?{Some(T.config->Rules.merge(rules))}
        ?shouldUnregister
      />
    }

    type useControllerProps<'a> = {
      name: string,
      control: control,
      rules: option<Rules.t<T.t>>,
      shouldUnregister: option<bool>,
    }

    @module("react-hook-form")
    external _useController: useControllerProps<'a> => render = "useController"
    let useController = (
      form,
      ~rules: option<Rules.t<T.t>>=?,
      ~shouldUnregister: option<bool>=?,
      (),
    ) =>
      _useController({
        name: T.name,
        control: form->control,
        rules,
        shouldUnregister,
      })

    @send
    external _triggerWithFocus: (
      t,
      string,
      @as(json`{shouldFocus: true}`) _,
    ) => Js.Promise.t<unit> = "trigger"
    let triggerWithFocus = form => form->_triggerWithFocus(T.name)

    let register = (form, ~config: option<Rules.t<T.t>>=?, ()) =>
      form->_register(T.name, Some(T.config->Rules.merge(config)))

    let renderWithRegister = (form, element, ~config=?, ()) => {
      React.cloneElement(element, form->register(~config=Rules.Any(config), ()))
    }
  }

  module MakeInputArray = (
    T: /* CreateFormInputConfig */ {
      type t
      let name: string
      let config: Rules.t<array<t>>
    },
  ) => {
    include MakeInput({
      type t = array<T.t>
      let name = T.name
      let config = T.config
    })

    type useFieldArrayOption = {
      control: control,
      name: string,
    }

    @ocaml.doc("`react-hook-form` UseFieldArrayReturn")
    type t2

    @module("react-hook-form")
    external _useFieldArray: (useFieldArrayOption, ~config: option<Rules.t<array<T.t>>>=?) => t2 =
      "useFieldArray"

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

    let useFieldArray = (form: t, ~config: option<Rules.t<array<T.t>>>=?, ()) => {
      _useFieldArray(
        {
          control: form->control,
          name: T.name,
        },
        ~config=Some(T.config->Rules.merge(config)),
      )
    }

    let registerWithIndex = (
      form,
      index: int,
      ~config: option<Rules.t<array<T.t>>>=?,
      ~property="",
      (),
    ) =>
      form->_register(
        `${T.name}.${index->Belt.Int.toString}${property != "" ? `.${property}` : ""}`,
        Some(T.config->Rules.merge(config)),
      )

    let renderWithIndexRegister = (form, index, element, ~property="", ~config=?, ()) => {
      React.cloneElement(
        element,
        form->registerWithIndex(index, ~config=Rules.Any(config), ~property, ()),
      )
    }
  }

  module Context = {
    @module("react-hook-form")
    external use: unit => t = "useFormContext"
  }

  module Provider = {
    module P = {
      @module("react-hook-form") @react.component
      external make: (~children: React.element) => React.element = "FormProvider"
    }

    module SpreadProps = {
      @react.component
      let make = (~children, ~props) => {
        React.cloneElement(children, props)
      }
    }

    @react.component
    let make = (~children, ~methods: t) =>
      <SpreadProps props={methods}>
        <P> {children} </P>
      </SpreadProps>
  }
}
