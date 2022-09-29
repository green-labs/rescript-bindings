// Global Functions
external describe: (string, @uncurry (unit => unit)) => unit = "describe"

type finishFn = @uncurry (unit => unit)

external test: (string, @uncurry (unit => unit)) => unit = "test"

external testPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "test"
external testAsync: (string, finishFn => unit) => unit = "test"

// test closure
module Test = {
  @scope("test")
  external only: (string, @uncurry (unit => unit)) => unit = "only"
  @scope("test")
  external onlyPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "only"
  @scope("test")
  external onlyAsync: (string, finishFn => unit) => unit = "only"

  @scope("test")
  external failing: (string, @uncurry (unit => unit)) => unit = "failing"
  @scope("test")
  external failingPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "failing"
  @scope("test")
  external failingAsync: (string, finishFn => unit) => unit = "failing"

  @scope("test")
  external skip: (string, @uncurry (unit => unit)) => unit = "skip"
  @scope("test")
  external skipPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "skip"
  @scope("test")
  external skipAsync: (string, finishFn => unit) => unit = "skip"

  @scope("test") external todo: string => unit = "todo"

  type each_fn1<'a> = (string, @uncurry ('a => unit)) => unit
  type each_fn2<'a, 'b> = (string, @uncurry ('a, 'b) => unit) => unit
  type each_fn3<'a, 'b, 'c> = (string, @uncurry ('a, 'b, 'c) => unit) => unit
  type each_fn4<'a, 'b, 'c, 'd> = (string, @uncurry ('a, 'b, 'c, 'd) => unit) => unit
  type each_fn5<'a, 'b, 'c, 'd, 'e> = (string, @uncurry ('a, 'b, 'c, 'd, 'e) => unit) => unit

  @scope("test")
  external each1: array<'a> => each_fn1<'a> = "each"
  @scope("test")
  external each2: array<('a, 'b)> => each_fn2<'a, 'b> = "each"
  @scope("test")
  external each3: array<('a, 'b, 'c)> => each_fn3<'a, 'b, 'c> = "each"
  @scope("test")
  external each4: array<('a, 'b, 'c, 'd)> => each_fn4<'a, 'b, 'c, 'd> = "each"
  @scope("test")
  external each5: array<('a, 'b, 'c, 'd, 'e)> => each_fn5<'a, 'b, 'c, 'd, 'e> = "each"

  type each_promise_fn1<'a> = (string, @uncurry ('a => Js.Promise.t<unit>)) => unit
  type each_promise_fn2<'a, 'b> = (string, @uncurry ('a, 'b) => Js.Promise.t<unit>) => unit
  type each_promise_fn3<'a, 'b, 'c> = (string, @uncurry ('a, 'b, 'c) => Js.Promise.t<unit>) => unit
  type each_promise_fn4<'a, 'b, 'c, 'd> = (
    string,
    @uncurry ('a, 'b, 'c, 'd) => Js.Promise.t<unit>,
  ) => unit
  type each_promise_fn5<'a, 'b, 'c, 'd, 'e> = (
    string,
    @uncurry ('a, 'b, 'c, 'd, 'e) => Js.Promise.t<unit>,
  ) => unit

  @scope("test")
  external eachPromise1: array<'a> => each_promise_fn1<'a> = "each"
  @scope("test")
  external eachPromise2: array<('a, 'b)> => each_promise_fn2<'a, 'b> = "each"
  @scope("test")
  external eachPromise3: array<('a, 'b, 'c)> => each_promise_fn3<'a, 'b, 'c> = "each"
  @scope("test")
  external eachPromise4: array<('a, 'b, 'c, 'd)> => each_promise_fn4<'a, 'b, 'c, 'd> = "each"
  @scope("test")
  external eachPromise5: array<('a, 'b, 'c, 'd, 'e)> => each_promise_fn5<'a, 'b, 'c, 'd, 'e> =
    "each"

  type each_async_fn1<'a> = (string, @uncurry ('a, finishFn) => unit) => unit
  type each_async_fn2<'a, 'b> = (string, @uncurry ('a, 'b, finishFn) => unit) => unit
  type each_async_fn3<'a, 'b, 'c> = (string, @uncurry ('a, 'b, 'c, finishFn) => unit) => unit
  type each_async_fn4<'a, 'b, 'c, 'd> = (
    string,
    @uncurry ('a, 'b, 'c, 'd, finishFn) => unit,
  ) => unit
  type each_async_fn5<'a, 'b, 'c, 'd, 'e> = (
    string,
    @uncurry ('a, 'b, 'c, 'd, 'e, finishFn) => unit,
  ) => unit

  @scope("test")
  external eachAsync1: array<'a> => each_async_fn1<'a> = "each"
  @scope("test")
  external eachAsync2: array<('a, 'b)> => each_async_fn2<'a, 'b> = "each"
  @scope("test")
  external eachAsync3: array<('a, 'b, 'c)> => each_async_fn3<'a, 'b, 'c> = "each"
  @scope("test")
  external eachAsync4: array<('a, 'b, 'c, 'd)> => each_async_fn4<'a, 'b, 'c, 'd> = "each"
  @scope("test")
  external eachAsync5: array<('a, 'b, 'c, 'd, 'e)> => each_async_fn5<'a, 'b, 'c, 'd, 'e> = "each"
}

external beforeEach: (@uncurry (unit => unit)) => unit = "beforeEach"

external beforeEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeEach"
external beforeEachAsync: (finishFn => unit) => unit = "beforeEach"

external beforeAll: (@uncurry (unit => unit)) => unit = "beforeAll"

external beforeAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeAll"
external beforeAllAsync: (finishFn => unit) => unit = "beforeAll"

external afterEach: (@uncurry (unit => unit)) => unit = "afterEach"

external afterEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterEach"
external afterEachAsync: (finishFn => unit) => unit = "afterEach"

external afterAll: (@uncurry (unit => unit)) => unit = "afterAll"

external afterAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterAll"
external afterAllAsync: (finishFn => unit) => unit = "afterAll"

// Mock Module
module Mock = {
  type t<'fn, 'args, 'return>

  external fn: t<'fn, _, _> => 'fn = "%identity"

  @scope("jest") external empty: unit => t<unit => unit, unit, unit> = "fn"
  @scope("jest") external make: ('a => 'b) => t<'a => 'b, 'a, 'b> = "fn"
  @scope("jest")
  external make2: (('a, 'b) => 'return) => t<('a, 'b) => 'return, ('a, 'b), 'return> = "fn"
  @scope("jest")
  external make3: (('a, 'b, 'c) => 'return) => t<('a, 'b, 'c) => 'return, ('a, 'b, 'c), 'return> =
    "fn"
  @scope("jest") external spyOn: ('spy, string) => t<'a, 'b, 'c> = "spyOn"
  @scope("jest")
  external spyOnGetter: ('spy, string, @as("json`'get'`") _) => t<'a, 'b, 'c> = "spyOn"
  @scope("jest")
  external spyOnSetter: ('spy, string, @as("json`'set'`") _) => t<'a, 'b, 'c> = "spyOn"

  // mock property
  type return_node<'a> = {
    @as("type") type_: [#return | #throw | #incomplete],
    value: 'a,
  }
  @get @scope("mock") external calls: t<_, 'args, _> => array<'args> = "calls"
  @get @scope("mock") external callsWrapArray: t<_, 'args, _> => array<array<'args>> = "calls"
  @get @scope("mock")
  external _results: t<_, _, 'return> => array<return_node<'return>> = "results"
  type result_type<'return, 'error> = Return('return) | Throw('error) | Imcomplete
  let results = (mock: t<_, _, 'return>): array<result_type<'return, 'error>> => {
    mock
    ->_results
    ->Belt.Array.map(result =>
      switch result.type_ {
      | #return => Return(result.value)
      | #throw => Throw(result.value)
      | #incomplete => Imcomplete
      }
    )
  }
  @get @scope("mock")
  external instances: t<_, _, 'return> => array<'return> = "instances"
  external lastCall: t<_, 'args, _> => option<'args> = "lastCall"
  external lastCallWrapArray: t<_, 'args, _> => option<array<'args>> = "lastCall"

  // functions
  @send external getMockName: t<_, _, _> => string = "getMockName"
  @send external setMockname: (t<_, _, _>, string) => unit = "mockName"
  @send external mockClear: t<_, _, _> => unit = "mockClear"
  @send external mockReset: t<_, _, _> => unit = "mockReset"
  @send external mockRestore: t<_, _, _> => unit = "mockRestore"
  @send external mockImplementation: (t<'fn, _, _>, 'fn) => unit = "mockImplementation"
  @send external mockImplementationOnce: (t<'fn, _, _>, 'fn) => unit = "mockImplementationOnce"
  @send external mockReturnValue: (t<_, _, 'return> => 'return) => unit = "mockReturnValue"
  @send external mockReturnValueOnce: (t<_, _, 'return> => 'return) => unit = "mockReturnValueOnce"
  @send
  external mockResolvedValue: (t<_, _, Js.Promise.t<'return>>, 'return) => unit =
    "mockResolvedValue"
  @send
  external mockResolvedValueOnce: (t<_, _, Js.Promise.t<'return>>, 'return) => unit =
    "mockResolvedValueOnce"
  @send external mockRejectedValue: (t<_, _, _>, 'b) => unit = "mockRejectedValue"
  @send external mockRejectedValueOnce: (t<_, _, _>, 'b) => unit = "mockRejectedValueOnce"
}

type expect<'r>
module Expect = {
  @get external not: expect<'a> => expect<'a> = "not"

  @send external toBe: (expect<'a>, 'a) => unit = "toBe"
  @send external toEqual: (expect<'a>, 'a) => unit = "toEqual"
  @send external toStrictEqual: (expect<'a>, 'a) => unit = "toStrictEqual"

  @send @scope("lastCalledWith")
  external lastCalledWith: (expect<Mock.t<_, _, _>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let lastCalledWith = (expect: expect<Mock.t<_, 'arg, _>>, argList: 'arg) =>
    expect->lastCalledWith(
      Js.Nullable.null,
      Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic,
    )
  @send
  external lastReturnedWith: (expect<Mock.t<_, _, 'return>>, 'return) => unit = "lastReturnedWith"

  @send @scope("nthCalledWith")
  external nthCalledWith: (expect<Mock.t<_, _, _>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let nthCalledWith = (expect: expect<Mock.t<_, 'arg, _>>, nth: int, argList: 'arg) =>
    expect->nthCalledWith(
      Js.Nullable.null,
      [nth]->Belt.Array.concat(Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic),
    )
  external nthReturnedWith: (expect<Mock.t<_, _, 'return>>, int, 'return) => unit =
    "nthReturnedWith"

  @send external toBeCalled: expect<Mock.t<_, _, _>> => unit = "toBeCalled"
  @send external toBeCalledTimes: (expect<Mock.t<_, _, _>>, int) => unit = "toBeCalledTimes"

  @send @scope("toBeCalledWith")
  external toBeCalledWith: (expect<Mock.t<_, _, _>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let toBeCalledWith = (expect: expect<Mock.t<_, 'arg, _>>, argList: 'arg) =>
    expect->toBeCalledWith(
      Js.Nullable.null,
      Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic,
    )

  @send
  external toReturnedWith: (expect<Mock.t<_, _, 'return>>, 'return) => unit = "toBeReturnedWith"

  @send external toBeCloseTo: (expect<float>, float) => unit = "toBeCloseTo"
  @send external toBeCloseToWithDigit: (expect<float>, float, int) => unit = "toBeCloseTo"

  @send external toBeDefined: expect<'a> => unit = "toBeDefined"
  @send external toBeFalsy: expect<'a> => unit = "toBeFalsy"
  @send external toBeTruthy: expect<'a> => unit = "toBeTruthy"

  @send external toBeGreaterThan: (expect<int>, int) => unit = "toBeGreaterThan"
  @send external toBeGreaterThanOrEqual: (expect<int>, int) => unit = "toBeGreaterThanOrEqual"
  @send external toBeGreaterThanFloat: (expect<float>, float) => unit = "toBeGreaterThan"
  @send
  external toBeGreaterThanOrEqualFloat: (expect<float>, float) => unit = "toBeGreaterThanOrEqual"

  @send external toBeLessThan: (expect<int>, int) => unit = "toBeLessThan"
  @send external toBeLessThanOrEqual: (expect<int>, int) => unit = "toBeLessThanOrEqual"
  @send external toBeLessThanFloat: (expect<float>, float) => unit = "toBeLessThan"
  @send external toBeLessThanOrEqualFloat: (expect<float>, float) => unit = "toBeLessThanOrEqual"

  @send external toBeNull: expect<Js.Nullable.t<'a>> => unit = "toBeNull"
  @send external toBeUndefined: expect<Js.Undefined.t<'a>> => unit = "toBeUndefined"

  @send external toBeNaN: expect<int> => unit = "toBeNaN"
  @send external toBeNaNFloat: expect<float> => unit = "toBeNaN"

  @send external toContain: (expect<array<'a>>, 'a) => unit = "toContain"
  @send external toContainEqual: (expect<array<'a>>, 'a) => unit = "toContainEqual"

  @send external toHaveLength: (expect<array<'a>>, int) => unit = "toHaveLength"
  @send external toHaveProperty: (expect<'a>, string) => unit = "toHaveProperty"
  @send external toHavePropertyValue: (expect<'a>, string, 'b) => unit = "toHaveProperty"

  @send external toMatch: (expect<string>, Js.Re.t) => unit = "toMatch"
  @send external toMatchString: (expect<string>, string) => unit = "toMatch"

  @send external toMatchObject: (expect<'a>, {..}) => unit = "toMatchObject"

  @send external toMatchSnapshot: expect<'a> => unit = "toMatchSnapshot"
  @send external toMatchInlineSnapshot: expect<'a> => unit = "toMatchInlineSnapshot"

  @send external toThrow: expect<unit => unit> => unit = "toThrow"
  @send external toThrowError: (expect<unit => unit>, Js.Exn.t) => unit = "toThrow"
}

external expect: 'a => expect<'a> = "expect"

// Jest Module
module JestJs = {
  // mock packages
  @scope("jest") external dontMock: string => unit = "dontMock"
  @scope("jest") external doMock: string => unit = "doMock"
  @scope("jest")
  external doMockFactory: (string, unit => 'a) => unit = "doMock"
  @scope("jest")
  external doMockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit =
    "doMock"

  @scope("jest") external mock: string => unit = "mock"
  @scope("jest")
  external mockFactory: (string, unit => 'a) => unit = "mock"
  @scope("jest")
  external mockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit = "mock"

  @scope("jest") external requireActual: string => 'a = "requireActual"
  @scope("jest") external requireMock: string => 'a = "requireMock"

  // global functions
  @scope("jest") external autoMockOff: unit => unit = "autoMockOff"
  @scope("jest") external autoMockOn: unit => unit = "autoMockOn"
  @scope("jest") external clearAllMocks: unit => unit = "clearAllMocks"
  @scope("jest") external resetAllMocks: unit => unit = "resetAllMocks"
  @scope("jest") external restoreAllMocks: unit => unit = "restoreAllMocks"
  @scope("jest") external clearAllTimers: unit => unit = "clearAllTimers"
  @scope("jest") external getTimerCount: unit => unit = "getTimerCount"
  @scope("jest") external setSystemTime: int => unit = "setSystemTime"
  @scope("jest")
  external setSystemDate: Js.Date.t => unit = "setSystemTime"
  @scope("jest")
  external getRealSystemTime: unit => int = "getRealSystemTime"
  @scope("jest") external disableAutomock: unit => unit = "disableAutomock"
  @scope("jest") external enableAutomock: unit => unit = "enableAutomock"
  @scope("jest") external resetModules: unit => unit = "resetModules"
  @scope("jest")
  external runAllImmediates: unit => unit = "runAllImmediates"
  @scope("jest") external runAllTicks: unit => unit = "runAllTicks"
  @scope("jest") external runAllTimers: unit => unit = "runAllTimers"
  @scope("jest")
  external runOnlyPendingTimers: unit => unit = "runOnlyPendingTimers"
  @scope("jest")
  external advanceTimersByTime: int => unit = "advanceTimersByTime"
  @scope("jest")
  external advanceTimersToNextTimer: int => unit = "advanceTimersToNextTimer"
  @scope("jest") external setTimeout: int => unit = "setTimeout"
  @scope("jest") external useFakeTimers: unit => unit = "useFakeTimers"
  @scope("jest") external useRealTimers: unit => unit = "useRealTimers"

  type fakeTimerConfig = {
    advanceTimers?: bool,
    doNotFake?: array<
      [
        | #Date
        | #hrtime
        | #nextTick
        | #performance
        | #queueMicrotask
        | #requestAnimationFrame
        | #cancelAnimationFrame
        | #requestIdleCallback
        | #cancelIdleCallback
        | #setImmediate
        | #clearImmediate
        | #setInterval
        | #clearInterval
        | #setTimeout
        | #clearTimeout
      ],
    >,
    legacyFakeTimers?: bool,
    now?: @unwrap [#Int(int) | #Date(Js.Date.t)],
    timerLimit?: int,
  }
  @scope("jest")
  external useFakeTimersWithConfig: fakeTimerConfig => unit = "useFakeTimers"
}
