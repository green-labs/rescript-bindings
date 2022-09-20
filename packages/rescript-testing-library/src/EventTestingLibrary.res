open Webapi

type t

type options = {
  advanceTimers?: int => Js.Promise.t<unit>,
  applyAccept?: bool,
  autoModify?: bool,
  delay?: int,
  document?: Dom.Document.t,
  skipAutoClose?: bool,
  skipClick?: bool,
  skipHover?: bool,
  writeToClipboard?: bool,
}

@module("@testing-library/user-event") @scope("default") external setup: unit => t = "setup"
@module("@testing-library/user-event") @scope("default")
external setupWithOption: unit => t = "setup"

@send external keyboard: (t, string) => Js.Promise.t<unit> = "keyword"
@send external tab: (t, string) => Js.Promise.t<unit> = "tab"
@send external tabShift: (t, string, @as("json`{ shift: true }`") _) => Js.Promise.t<unit> = "tab"

@send external click: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "click"
@send external dblClick: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "dblClick"
@send external tripleClick: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "tripleClick"
@send external hover: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "hover"
@send external unhover: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "unhover"

// clipboard
@send external copy: t => Js.Promise.t<option<Dom.DataTransfer.t>> = "copy"
@send external cut: t => Js.Promise.t<option<Dom.DataTransfer.t>> = "cut"
@send external paste: (t, string) => Js.Promise.t<unit> = "paste"
@send external pasteDataTransfer: (t, Dom.DataTransfer.t) => Js.Promise.t<unit> = "paste"

// utils
@send external clear: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "clear"

// (de)select options
@send external selectOptions: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "selectOptions"
@send
external selectOptionsArray: (t, Dom.HtmlElement.t, array<string>) => Js.Promise.t<unit> =
  "selectOptions"
@send
external selectOptionsElement: (t, Dom.HtmlElement.t, Dom.HtmlElement.t) => Js.Promise.t<unit> =
  "selectOptions"
@send
external selectOptionsElementArray: (
  t,
  Dom.HtmlElement.t,
  array<Dom.HtmlElement.t>,
) => Js.Promise.t<unit> = "selectOptions"

@send
external deselectOptions: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "deselectOptions"
@send
external deselectOptionsArray: (t, Dom.HtmlElement.t, array<string>) => Js.Promise.t<unit> =
  "deselectOptions"
@send
external deselectOptionsElement: (t, Dom.HtmlElement.t, Dom.HtmlElement.t) => Js.Promise.t<unit> =
  "deselectOptions"
@send
external deselectOptionsElementArray: (
  t,
  Dom.HtmlElement.t,
  array<Dom.HtmlElement.t>,
) => Js.Promise.t<unit> = "deselectOptions"

// type
type typeOption = {
  skipClick?: bool,
  skipAutoClose?: bool,
  initialSelectionStart?: int,
  initialSelectionEnd?: int,
}
@send external type_: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "type"
@send
external typeWithOption: (t, Dom.HtmlElement.t, string, typeOption) => Js.Promise.t<unit> = "type"

// pointer
type pointer
type pointerCoords = {
  x?: int,
  y?: int,
  clientX?: int,
  clientY?: int,
  offsetX?: int,
  offsetY?: int,
  pageX?: int,
  pageY?: int,
  screenX?: int,
  screenY?: int,
}
type pointerActionPosition = {
  keys: string,
  target?: Dom.HtmlElement.t,
  coords?: pointerCoords,
  node?: Dom.Node.t,
  offset?: int,
}
type pointerKey = {
  /** Name of the pointer key */
  name: string,
  /** Type of the pointer device */
  pointerType: [#mouse | #pen | #touch],
  /** Type of button */
  button?: int, // @TODO: https://github.com/testing-library/user-event/blob/1aa2027e5ec445ab413808556efa7763b65053d3/src/system/pointer/buttons.ts#L45
}
type pointerPressAction = {
  target?: Dom.HtmlElement.t,
  coords?: pointerCoords,
  node?: Dom.Node.t,
  offset?: int,
  keyDef: pointerKey,
  releasePrevious: bool,
  releaseSelf: bool,
}
type pointerMoveAction = {
  target?: Dom.HtmlElement.t,
  coords?: pointerCoords,
  node?: Dom.Node.t,
  offset?: int,
  pointerName?: string,
}
external createPointer: string => pointer = "%identity"
external createPointerActionPosition: pointerActionPosition => pointer = "%identity"
external createPointerPressAction: pointerPressAction => pointer = "%identity"
external createPointerMoveAction: pointerMoveAction => pointer = "%identity"

@send external pointer: (t, string) => Js.Promise.t<unit> = "pointer"
@send external pointerByIdentifier: (t, pointer) => Js.Promise.t<unit> = "pointer"
@send external pointerWithArray: (t, array<pointer>) => Js.Promise.t<unit> = "pointer"
