module Dom = DomTestingLibrary
module React = ReactTestingLibrary
module Event = EventTestingLibrary
module JestExpect = JestExpectTestingLibrary

type mutationObserverInit = {
  subtree?: bool,
  childList?: bool,
  attributes?: bool,
  characterData?: bool,
}

type waitForOption = {
  container?: Webapi.Dom.HtmlElement.t,
  timeout?: int,
  interval?: int,
  onTimeout?: Js.Exn.t => Js.Exn.t,
  mutationObserverOptions?: mutationObserverInit,
}

@module("@testing-library/dom")
external waitFor: (@uncurry unit => Js.Promise.t<'value>) => Js.Promise.t<'value> = "waitFor"
@module("@testing-library/dom")
external waitForWithOption: (
  @uncurry unit => Js.Promise.t<'value>,
  waitForOption,
) => Js.Promise.t<'value> = "waitFor"

@module("@testing-library/dom")
external waitForElementToBeRemoved: Webapi.Dom.HtmlElement.t => Js.Promise.t<unit> =
  "waitForElementToBeRemoved"
@module("@testing-library/dom")
external waitForElementToBeRemovedWithOption: (
  Webapi.Dom.HtmlElement.t,
  waitForOption,
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"

@module("@testing-library/dom")
external waitForElementToBeRemovedCallback: (
  @uncurry unit => Webapi.Dom.HtmlElement.t
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"
@module("@testing-library/dom")
external waitForElementToBeRemovedCallbackWithOption: (
  @uncurry unit => Webapi.Dom.HtmlElement.t,
  waitForOption,
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"

@module("@testing-library/dom")
external waitForElementToBeRemovedArray: array<Webapi.Dom.HtmlElement.t> => Js.Promise.t<unit> =
  "waitForElementToBeRemoved"
@module("@testing-library/dom")
external waitForElementToBeRemovedArrayWithOption: (
  array<Webapi.Dom.HtmlElement.t>,
  waitForOption,
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"

@module("@testing-library/dom")
external waitForElementToBeRemovedArrayCallback: (
  @uncurry unit => array<Webapi.Dom.HtmlElement.t>
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"
@module("@testing-library/dom")
external waitForElementToBeRemovedArrayCallbackWithOption: (
  @uncurry unit => array<Webapi.Dom.HtmlElement.t>,
  waitForOption,
) => Js.Promise.t<unit> = "waitForElementToBeRemoved"
