open Webapi

type t<'r> = Jest.expect<'r>

@send external toBeDisabled: t<Dom.HtmlElement.t> => unit = "toBeDisabled"
@send external toBeEnabled: t<Dom.HtmlElement.t> => unit = "toBeEnabled"
@send external toBeEmptyDOMElement: t<Dom.HtmlElement.t> => unit = "toBeEmptyDOMElement"
@send external toBeInTheDocument: t<option<Dom.HtmlElement.t>> => unit = "toBeInTheDocument"
@send external toBeInvalid: t<Dom.HtmlElement.t> => unit = "toBeInvalid"
@send external toBeRequired: t<Dom.HtmlElement.t> => unit = "toBeRequired"
@send external toBeValid: t<Dom.HtmlElement.t> => unit = "toBeValid"
@send external toBeVisible: t<Dom.HtmlElement.t> => unit = "toBeVisible"
@send
external toContainElement: (t<Dom.HtmlElement.t>, option<Dom.HtmlElement.t>) => unit =
  "toContainElement"
@send external toContainHTML: (t<Dom.HtmlElement.t>, string) => unit = "toContainHTML"
@send
external toHaveAccessibleDescription: (t<Dom.HtmlElement.t>, string) => unit =
  "toHaveAccessibleDescription"
@send
external toHaveAccessibleDescriptionRegex: (t<Dom.HtmlElement.t>, Js.Re.t) => unit =
  "toHaveAccessibleDescription"
@send external toHaveAccessibleName: (t<Dom.HtmlElement.t>, string) => unit = "toHaveAccessibleName"
@send
external toHaveAccessibleNameRegex: (t<Dom.HtmlElement.t>, Js.Re.t) => unit = "toHaveAccessibleName"
@send external toHaveAttribute: (t<Dom.HtmlElement.t>, string, 'value) => unit = "toHaveAttribute"
@send external toHaveClass: (t<Dom.HtmlElement.t>, string) => unit = "toHaveClass"
@send
external toHaveClassExact: (t<Dom.HtmlElement.t>, string, @as("json`{ exact: true }`") _) => unit =
  "toHaveClass"
@send external toHaveFocus: t<Dom.HtmlElement.t> => unit = "toHaveFocus"
@send external toHaveFormValues: (t<Dom.HtmlElement.t>, 'formValues) => unit = "toHaveFormValues"
@send external toHaveStyle: (t<Dom.HtmlElement.t>, string) => unit = "toHaveStyle"
@send external toHaveStyleObject: (t<Dom.HtmlElement.t>, 'styleObject) => unit = "toHaveStyle"
@send external toHaveTextContent: (t<Dom.HtmlElement.t>, string) => unit = "toHaveTextContent"
@send
external toHaveTextContentNormalizeWhitespace: (
  t<Dom.HtmlElement.t>,
  string,
  @as("json`{ normalizeWhitespace: true }`") _,
) => unit = "toHaveTextContent"
@send external toHaveTextContentRegex: (t<Dom.HtmlElement.t>, Js.Re.t) => unit = "toHaveTextContent"
@send
external toHaveTextContentRegexNormalizeWhitespace: (
  t<Dom.HtmlElement.t>,
  Js.Re.t,
  @as("json`{ normalizeWhitespace: true }`") _,
) => unit = "toHaveTextContent"
@send external toHaveValue: (t<Dom.HtmlElement.t>, string) => unit = "toHaveValue"
@send external toHaveValueArray: (t<Dom.HtmlElement.t>, array<string>) => unit = "toHaveValue"
@send external toHaveValueNumber: (t<Dom.HtmlElement.t>, int) => unit = "toHaveValue"
@send external toHaveDisplayValue: (t<Dom.HtmlElement.t>, string) => unit = "toHaveDisplayValue"
@send
external toHaveDisplayValueArray: (t<Dom.HtmlElement.t>, array<string>) => unit =
  "toHaveDisplayValue"
@send
external toHaveDisplayValueRegex: (t<Dom.HtmlElement.t>, Js.Re.t) => unit = "toHaveDisplayValue"
@send
external toHaveDisplayValueRegexArray: (t<Dom.HtmlElement.t>, array<Js.Re.t>) => unit =
  "toHaveDisplayValue"
@send
external toHaveDisplayValueMixedArray: (
  t<Dom.HtmlElement.t>,
  array<@unwrap [#Str(string) | #Regex(Js.Re.t)]>,
) => unit = "toHaveDisplayValue"
@send external toBeChecked: t<Dom.HtmlElement.t> => unit = "toBeChecked"
@send external toBePartiallyChecked: t<Dom.HtmlElement.t> => unit = "toBePartiallyChecked"
@send external toHaveErrorMessage: (t<Dom.HtmlElement.t>, string) => unit = "toHaveErrorMessage"
@send
external toHaveErrorMessageRegex: (t<Dom.HtmlElement.t>, Js.Re.t) => unit = "toHaveErrorMessage"
