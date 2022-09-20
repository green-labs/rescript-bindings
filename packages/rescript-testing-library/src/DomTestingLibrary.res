open Webapi

type t

@module("@testing-library/dom")
external screen: t = "screen"

type queryFunction = (option<string>, option<Dom.Element.t>) => bool

module ByRole = {
  type options = {
    exact?: bool,
    hidden?: bool,
    name?: @unwrap
    [
      | #String(string)
      | #Regex(Js.Re.t)
      | #Function((option<string>, option<Dom.Element.t>) => bool)
    ],
    description?: @unwrap
    [
      | #String(string)
      | #Regex(Js.Re.t)
      | #Function((option<string>, option<Dom.Element.t>) => bool)
    ],
    normalizer?: string => string,
    selected?: bool,
    checked?: bool,
    pressed?: bool,
    current?: @unwrap [#String(string) | #Boolean(bool)],
    expanded?: bool,
    queryFallbacks?: bool,
    level?: int,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByRole"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByRole"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByRole"
  @send external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByRole"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByRole"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t = "getByRole"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByRole"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByRole"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByRole"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByRole"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByRole"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByRole"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByRole"
  @send external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByRole"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByRole"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByRole"
  @send external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByRole"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByRole"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByRole"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByRole"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByRole"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByRole"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByRole"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByRole"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByRole"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> = "queryByRole"
  @send external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByRole"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByRole"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> = "queryByRole"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByRole"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByRole"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByRole"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByRole"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByRole"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByRole"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByRole"
}

module ByLabel = {
  type options = {
    selector?: string,
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByLabel"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByLabel"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByLabel"
  @send external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByLabel"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByLabel"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByLabel"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByLabel"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByLabel"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByLabel"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByLabel"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByLabel"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByLabel"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByLabel"
  @send external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByLabel"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByLabel"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByLabel"
  @send external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByLabel"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByLabel"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByLabel"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByLabel"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByLabel"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByLabel"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByLabel"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByLabel"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByLabel"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> = "queryByLabel"
  @send external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByLabel"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByLabel"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> = "queryByLabel"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByLabel"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByLabel"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByLabel"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByLabel"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByLabel"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByLabel"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByLabel"
}

module ByPlaceholderText = {
  type options = {
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByPlaceholderText"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByPlaceholderText"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByPlaceholderText"
  @send
  external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t =
    "getByPlaceholderText"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByPlaceholderText"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByPlaceholderText"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByPlaceholderText"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
    "getAllByPlaceholderText"
  @send
  external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByPlaceholderText"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByPlaceholderText"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
    "getAllByPlaceholderText"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByPlaceholderText"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByPlaceholderText"
  @send
  external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> =
    "findByPlaceholderText"
  @send
  external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByPlaceholderText"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByPlaceholderText"
  @send
  external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> =
    "findByPlaceholderText"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByPlaceholderText"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByPlaceholderText"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
    "findAllByPlaceholderText"
  @send
  external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByPlaceholderText"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByPlaceholderText"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
    "findAllByPlaceholderText"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByPlaceholderText"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByPlaceholderText"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByPlaceholderText"
  @send
  external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByPlaceholderText"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByPlaceholderText"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByPlaceholderText"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByPlaceholderText"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByPlaceholderText"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByPlaceholderText"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByPlaceholderText"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByPlaceholderText"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByPlaceholderText"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByPlaceholderText"
}

module ByText = {
  type options = {
    selector?: string,
    exact?: bool,
    ignore?: @unwrap [#String(string) | #Boolean(bool)],
    normalizer?: string => string,
  }

  @send external get: (t, string) => Dom.HtmlElement.t = "getByText"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByText"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByText"
  @send external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByText"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByText"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t = "getByText"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByText"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByText"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByText"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByText"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByText"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByText"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByText"
  @send external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByText"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByText"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByText"
  @send external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByText"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByText"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByText"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByText"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByText"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByText"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByText"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByText"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByText"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> = "queryByText"
  @send external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByText"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByText"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> = "queryByText"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByText"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByText"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByText"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByText"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByText"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByText"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByText"
}

module ByDisplayValue = {
  type options = {
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByDisplayValue"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByDisplayValue"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByDisplayValue"
  @send
  external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByDisplayValue"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByDisplayValue"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByDisplayValue"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByDisplayValue"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
    "getAllByDisplayValue"
  @send
  external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByDisplayValue"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByDisplayValue"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
    "getAllByDisplayValue"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByDisplayValue"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByDisplayValue"
  @send
  external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByDisplayValue"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByDisplayValue"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByDisplayValue"
  @send
  external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByDisplayValue"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByDisplayValue"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByDisplayValue"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
    "findAllByDisplayValue"
  @send
  external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByDisplayValue"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByDisplayValue"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
    "findAllByDisplayValue"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByDisplayValue"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByDisplayValue"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByDisplayValue"
  @send
  external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByDisplayValue"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByDisplayValue"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByDisplayValue"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByDisplayValue"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByDisplayValue"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByDisplayValue"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByDisplayValue"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByDisplayValue"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByDisplayValue"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByDisplayValue"
}

module ByAltText = {
  type options = {
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByAltText"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByAltText"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByAltText"
  @send
  external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByAltText"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByAltText"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByAltText"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByAltText"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByAltText"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByAltText"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByAltText"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByAltText"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByAltText"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByAltText"
  @send
  external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByAltText"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByAltText"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByAltText"
  @send
  external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByAltText"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByAltText"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByAltText"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByAltText"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByAltText"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByAltText"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByAltText"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByAltText"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByAltText"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByAltText"
  @send
  external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByAltText"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByAltText"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByAltText"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByAltText"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByAltText"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByAltText"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByAltText"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByAltText"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByAltText"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByAltText"
}

module ByTitle = {
  type options = {
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByTitle"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByTitle"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByTitle"
  @send external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByTitle"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByTitle"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByTitle"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByTitle"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByTitle"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByTitle"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByTitle"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByTitle"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByTitle"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByTitle"
  @send external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByTitle"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByTitle"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByTitle"
  @send external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByTitle"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByTitle"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByTitle"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByTitle"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByTitle"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByTitle"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByTitle"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByTitle"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTitle"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTitle"
  @send external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTitle"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByTitle"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTitle"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTitle"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTitle"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTitle"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTitle"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTitle"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTitle"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTitle"
}

module ByTestId = {
  type options = {
    exact?: bool,
    normalizer?: string => string,
  }
  @send external get: (t, string) => Dom.HtmlElement.t = "getByTestId"
  @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByTestId"
  @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByTestId"
  @send
  external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByTestId"
  @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByTestId"
  @send
  external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
    "getByTestId"

  @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByTestId"
  @send
  external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByTestId"
  @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByTestId"
  @send
  external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "getAllByTestId"
  @send
  external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByTestId"
  @send
  external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "getAllByTestId"

  @send external find: (t, string) => option<Dom.HtmlElement.t> = "findByTestId"
  @send
  external findWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "findByTestId"
  @send external findFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "findByTestId"
  @send
  external findFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
    "findByTestId"
  @send
  external findFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "findByTestId"
  @send
  external findFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
    "findByTestId"

  @send external findAll: (t, string) => array<Dom.HtmlElement.t> = "findAllByTestId"
  @send
  external findAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "findAllByTestId"
  @send external findAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "findAllByTestId"
  @send
  external findAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
    "findAllByTestId"
  @send
  external findAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "findAllByTestId"
  @send
  external findAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
    "findAllByTestId"

  @send external query: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTestId"
  @send
  external queryWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByTestId"
  @send external queryFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTestId"
  @send
  external queryFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByTestId"
  @send
  external queryFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> =
    "queryByTestId"
  @send
  external queryFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<Dom.HtmlElement.t> = "queryByTestId"

  @send
  external queryAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTestId"
  @send
  external queryAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTestId"
  @send
  external queryAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTestId"
  @send
  external queryAllFromRegexWithOption: (
    t,
    Js.Re.t,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTestId"
  @send
  external queryAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
    "queryAllByTestId"
  @send
  external queryAllFromFunctionWithOption: (
    t,
    queryFunction,
    options,
  ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "queryAllByTestId"
}
