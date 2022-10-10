open Webapi

// type Jest.expect<'value, 'return, 'expect_ret> = Jest.expecJest.expect<'value, 'return, 'expect_ret>

@send
external toBeDisabled: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeDisabled"
@send
external toBeEnabled: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeEnabled"
@send
external toBeEmptyDOMElement: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret =
  "toBeEmptyDOMElement"
@send
external toBeInTheDocument: Jest.expect<option<Dom.HtmlElement.t>, 'expect_ret> => 'expect_ret =
  "toBeInTheDocument"
@send
external toBeInvalid: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeInvalid"
@send
external toBeRequired: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeRequired"
@send external toBeValid: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeValid"
@send
external toBeVisible: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeVisible"
@send
external toContainElement: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  option<Dom.HtmlElement.t>,
) => 'expect_ret = "toContainElement"
@send
external toContainHTML: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toContainHTML"
@send
external toHaveAccessibleDescription: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  string,
) => 'expect_ret = "toHaveAccessibleDescription"
@send
external toHaveAccessibleDescriptionRegex: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
) => 'expect_ret = "toHaveAccessibleDescription"
@send
external toHaveAccessibleName: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  string,
) => 'expect_ret = "toHaveAccessibleName"
@send
external toHaveAccessibleNameRegex: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
) => 'expect_ret = "toHaveAccessibleName"
@send
external toHaveAttribute: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  string,
  'value,
) => 'expect_ret = "toHaveAttribute"
@send
external toHaveClass: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveClass"
@send
external toHaveClassExact: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  string,
  @as("json`{ exact: true }`") _,
) => 'expect_ret = "toHaveClass"
@send
external toHaveFocus: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toHaveFocus"
@send
external toHaveFormValues: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  'formValues,
) => 'expect_ret = "toHaveFormValues"
@send
external toHaveStyle: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveStyle"
@send
external toHaveStyleObject: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  'styleObject,
) => 'expect_ret = "toHaveStyle"
@send
external toHaveTextContent: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveTextContent"
@send
external toHaveTextContentNormalizeWhitespace: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  string,
  @as("json`{ normalizeWhitespace: true }`") _,
) => 'expect_ret = "toHaveTextContent"
@send
external toHaveTextContentRegex: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
) => 'expect_ret = "toHaveTextContent"
@send
external toHaveTextContentRegexNormalizeWhitespace: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
  @as("json`{ normalizeWhitespace: true }`") _,
) => 'expect_ret = "toHaveTextContent"
@send
external toHaveValue: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveValue"
@send
external toHaveValueArray: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  array<string>,
) => 'expect_ret = "toHaveValue"
@send
external toHaveValueNumber: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, int) => 'expect_ret =
  "toHaveValue"
@send
external toHaveDisplayValue: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveDisplayValue"
@send
external toHaveDisplayValueArray: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  array<string>,
) => 'expect_ret = "toHaveDisplayValue"
@send
external toHaveDisplayValueRegex: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
) => 'expect_ret = "toHaveDisplayValue"
@send
external toHaveDisplayValueRegexArray: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  array<Js.Re.t>,
) => 'expect_ret = "toHaveDisplayValue"
@send
external toHaveDisplayValueMixedArray: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  array<@unwrap [#Str(string) | #Regex(Js.Re.t)]>,
) => 'expect_ret = "toHaveDisplayValue"
@send
external toBeChecked: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret = "toBeChecked"
@send
external toBePartiallyChecked: Jest.expect<Dom.HtmlElement.t, 'expect_ret> => 'expect_ret =
  "toBePartiallyChecked"
@send
external toHaveErrorMessage: (Jest.expect<Dom.HtmlElement.t, 'expect_ret>, string) => 'expect_ret =
  "toHaveErrorMessage"
@send
external toHaveErrorMessageRegex: (
  Jest.expect<Dom.HtmlElement.t, 'expect_ret>,
  Js.Re.t,
) => 'expect_ret = "toHaveErrorMessage"
