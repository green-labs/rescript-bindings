open Webapi

// act
@module("@testing-library/react")
external act: (@uncurry unit => unit) => unit = "act"

@ocaml.warn(
  "When using act by promise, you should replace testPromise to testAsync (from `@greenlabs/react-jest`) because act using fake promise only support async/await syntax"
)
@module("@testing-library/react")
external actPromise: (@uncurry unit => Js.Promise.t<unit>) => Js.Promise.t<unit> = "act"

@module("@testing-library/react") external cleanup: unit => unit = "cleanup"

type renderResult = {
  container: Dom.HtmlElement.t,
  baseElement: Dom.HtmlElement.t,
}

type renderOption = {
  container?: Dom.HtmlElement.t,
  baseElement?: Dom.HtmlElement.t,
  hydrate?: bool,
  legacyRoot?: bool,
  wrapper?: React.element,
}

// render component
@module("@testing-library/react")
external render: React.element => renderResult = "render"

@module("@testing-library/react")
external renderWithOption: (React.element, renderOption) => renderResult = "render"

// render result functions
module Render = {
  @send external debug: renderResult => unit = "debug"
  @send external unmount: renderResult => unit = "unmount"
  @send external asFragment: renderResult => Dom.DocumentFragment.t = "asFragment"
  @send external rerender: (renderResult, React.element) => unit = "rerender"
}

// render hook
type rec current<'value> = {current: 'value}
and renderHookResult<'props, 'return> = {result: current<'return>}

type renderHookOption<'props> = {
  initialProps?: 'props,
  wrapper?: React.element,
}

@module("@testing-library/react")
external renderHook: ('props => 'return) => renderHookResult<'props, 'return> = "renderHook"
external renderHookWithOption: (
  'props => 'result,
  renderHookOption<'props>,
) => renderHookResult<'props, 'return> = "renderHook"

module RenderHook = {
  @send external rerender: (renderHookResult<'props, 'return>, 'props) => unit = "rerender"
}
