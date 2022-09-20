// Global Functions
@module("@jest/globals") external describe: (string, @uncurry (unit => unit)) => unit = "describe"

type finishFn = @uncurry (unit => unit)

@module("@jest/globals") external test: (string, @uncurry (unit => unit)) => unit = "test"
@module("@jest/globals")
external testPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "test"
@module("@jest/globals") external testAsync: (string, finishFn => unit) => unit = "test"

// test closure
module Test = {
  @module("@jest/globals") @scope("test")
  external only: (string, @uncurry (unit => unit)) => unit = "only"
  @module("@jest/globals") @scope("test")
  external onlyPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "only"
  @module("@jest/globals") @scope("test")
  external onlyAsync: (string, finishFn => unit) => unit = "only"

  @module("@jest/globals") @scope("test")
  external failing: (string, @uncurry (unit => unit)) => unit = "failing"
  @module("@jest/globals") @scope("test")
  external failingPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "failing"
  @module("@jest/globals") @scope("test")
  external failingAsync: (string, finishFn => unit) => unit = "failing"

  @module("@jest/globals") @scope("test")
  external skip: (string, @uncurry (unit => unit)) => unit = "skip"
  @module("@jest/globals") @scope("test")
  external skipPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "skip"
  @module("@jest/globals") @scope("test")
  external skipAsync: (string, finishFn => unit) => unit = "skip"

  @module("@jest/globals") @scope("test") external todo: string => unit = "todo"

  @module("@jest/globals") @scope("test")
  external each1: (array<'a>, string, 'a => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external each2: (array<('a, 'b)>, string, ('a, 'b) => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external each3: (array<('a, 'b, 'c)>, string, ('a, 'b, 'c) => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external each4: (array<('a, 'b, 'c, 'd)>, string, ('a, 'b, 'c, 'd) => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external each5: (array<('a, 'b, 'c, 'd, 'e)>, string, ('a, 'b, 'c, 'd, 'e) => unit) => unit =
    "each"

  @module("@jest/globals") @scope("test")
  external eachPromise1: (array<'a>, string, 'a => Js.Promise.t<'t>) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachPromise2: (array<('a, 'b)>, string, ('a, 'b) => Js.Promise.t<'t>) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachPromise3: (array<('a, 'b, 'c)>, string, ('a, 'b, 'c) => Js.Promise.t<'t>) => unit =
    "each"
  @module("@jest/globals") @scope("test")
  external eachPromise4: (
    array<('a, 'b, 'c, 'd)>,
    string,
    ('a, 'b, 'c, 'd) => Js.Promise.t<'t>,
  ) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachPromise5: (
    array<('a, 'b, 'c, 'd, 'e)>,
    string,
    ('a, 'b, 'c, 'd, 'e) => Js.Promise.t<'t>,
  ) => unit = "each"

  @module("@jest/globals") @scope("test")
  external eachAsync1: (array<'a>, string, ('a, finishFn) => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachAsync2: (array<('a, 'b)>, string, ('a, 'b, finishFn) => unit) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachAsync3: (array<('a, 'b, 'c)>, string, ('a, 'b, 'c, finishFn) => unit) => unit =
    "each"
  @module("@jest/globals") @scope("test")
  external eachAsync4: (
    array<('a, 'b, 'c, 'd)>,
    string,
    ('a, 'b, 'c, 'd, finishFn) => unit,
  ) => unit = "each"
  @module("@jest/globals") @scope("test")
  external eachAsync5: (
    array<('a, 'b, 'c, 'd, 'e)>,
    string,
    ('a, 'b, 'c, 'd, 'e, finishFn) => unit,
  ) => unit = "each"
}

@module("@jest/globals") external beforeEach: (@uncurry (unit => unit)) => unit = "beforeEach"
@module("@jest/globals")
external beforeEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeEach"
@module("@jest/globals") external beforeEachAsync: (finishFn => unit) => unit = "beforeEach"

@module("@jest/globals") external beforeAll: (@uncurry (unit => unit)) => unit = "beforeAll"
@module("@jest/globals")
external beforeAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeAll"
@module("@jest/globals") external beforeAllAsync: (finishFn => unit) => unit = "beforeAll"

@module("@jest/globals") external afterEach: (@uncurry (unit => unit)) => unit = "afterEach"
@module("@jest/globals")
external afterEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterEach"
@module("@jest/globals") external afterEachAsync: (finishFn => unit) => unit = "afterEach"

@module("@jest/globals") external afterAll: (@uncurry (unit => unit)) => unit = "afterAll"
@module("@jest/globals")
external afterAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterAll"
@module("@jest/globals") external afterAllAsync: (finishFn => unit) => unit = "afterAll"

// Mock Module
module Mock = {
  type t<'args, 'return>

  type fn<'args, 'return> = 'args => 'return
  external fn: t<'args, 'return> => fn<'args, 'return> = "%identity"

  @module("@jest/globals") @scope("jest") external empty: unit => t<'a, 'b> = "fn"
  @module("@jest/globals") @scope("jest") external make: ('a => 'b) => t<'a, 'b> = "fn"
  @module("@jest/globals") @scope("jest")
  external make2: (('a, 'b) => 'return) => t<('a, 'b), 'return> = "fn"
  @module("@jest/globals") @scope("jest")
  external make3: (('a, 'b, 'c) => 'return) => t<('a, 'b, 'c), 'return> = "fn"
  @module("@jest/globals") @scope("jest") external spyOn: ('spy, string) => t<'a, 'b> = "spyOn"
  @module("@jest/globals") @scope("jest")
  external spyOnGetter: ('spy, string, @as("json`'get'`") _) => t<'a, 'b> = "spyOn"
  @module("@jest/globals") @scope("jest")
  external spyOnSetter: ('spy, string, @as("json`'set'`") _) => t<'a, 'b> = "spyOn"

  // mock property
  type return_node<'a> = {
    @as("type") type_: [#return | #throw | #incomplete],
    value: 'a,
  }
  @get @scope("mock") external calls: t<'args, 'return> => array<'args> = "calls"
  @get @scope("mock") external callsWrapArray: t<'args, 'return> => array<array<'args>> = "calls"
  @get @scope("mock")
  external _results: t<'args, 'return> => array<return_node<'return>> = "results"
  type result_type<'return, 'error> = Return('return) | Throw('error) | Imcomplete
  let results = (mock: t<'args, 'return>): array<result_type<'return, 'error>> => {
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
  external instances: t<'args, 'return> => array<'return> = "instances"
  external lastCall: t<'args, 'return> => option<'args> = "lastCall"
  external lastCallWrapArray: t<'args, 'return> => option<array<'args>> = "lastCall"

  // functions
  @send external getMockName: t<'a, 'r> => string = "getMockName"
  @send external setMockname: (t<'a, 'r>, string) => unit = "mockName"
  @send external mockClear: t<'a, 'r> => unit = "mockClear"
  @send external mockReset: t<'a, 'r> => unit = "mockReset"
  @send external mockRestore: t<'a, 'r> => unit = "mockRestore"
  @send external mockImplementation: (t<'a, 'r>, fn<'a, 'r>) => unit = "mockImplementation"
  @send external mockImplementationOnce: (t<'a, 'r>, fn<'a, 'r>) => unit = "mockImplementationOnce"
  @send external mockReturnValue: (t<'a, 'r>, 'r) => unit = "mockReturnValue"
  @send external mockReturnValueOnce: (t<'a, 'r>, 'r) => unit = "mockReturnValueOnce"
  @send external mockResolvedValue: (t<'a, Js.Promise.t<'r>>, 'r) => unit = "mockResolvedValue"
  @send
  external mockResolvedValueOnce: (t<'a, Js.Promise.t<'r>>, 'r) => unit = "mockResolvedValueOnce"
  @send external mockRejectedValue: (t<'a, 'r>, 'b) => unit = "mockRejectedValue"
  @send external mockRejectedValueOnce: (t<'a, 'r>, 'b) => unit = "mockRejectedValueOnce"
}

module Expect = {
  type t<'r>

  @get external not: t<'a> => t<'a> = "not"

  @send external toBe: (t<'a>, 'a) => unit = "toBe"
  @send external toEqual: (t<'a>, 'a) => unit = "toEqual"
  @send external toStrictEqual: (t<'a>, 'a) => unit = "toStrictEqual"

  @send @scope("lastCalledWith")
  external lastCalledWith: (t<Mock.t<'arg, 'return>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let lastCalledWith = (expect: t<Mock.t<'arg, 'return>>, argList: 'arg) =>
    expect->lastCalledWith(
      Js.Nullable.null,
      Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic,
    )
  @send external lastReturnedWith: (t<Mock.t<'arg, 'return>>, 'b) => unit = "lastReturnedWith"

  @send @scope("nthCalledWith")
  external nthCalledWith: (t<Mock.t<'arg, 'return>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let nthCalledWith = (expect: t<Mock.t<'arg, 'return>>, nth: int, argList: 'arg) =>
    expect->nthCalledWith(
      Js.Nullable.null,
      [nth]->Belt.Array.concat(Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic),
    )
  external nthReturnedWith: (t<Mock.t<'arg, 'return>>, int, 'b) => unit = "nthReturnedWith"

  @send external toBeCalled: t<Mock.t<'arg, 'return>> => unit = "toBeCalled"
  @send external toBeCalledTimes: (t<Mock.t<'arg, 'return>>, int) => unit = "toBeCalledTimes"

  @send @scope("toBeCalledWith")
  external toBeCalledWith: (t<Mock.t<'arg, 'return>>, Js.Nullable.t<'a>, 'b) => unit = "apply"
  let toBeCalledWith = (expect: t<Mock.t<'arg, 'return>>, argList: 'arg) =>
    expect->toBeCalledWith(
      Js.Nullable.null,
      Js.Array2.isArray(argList) ? argList : [argList]->Obj.magic,
    )

  @send external toReturnedWith: (t<Mock.t<'arg, 'return>>, 'b) => unit = "toBeReturnedWith"

  @send external toBeCloseTo: (t<float>, float) => unit = "toBeCloseTo"
  @send external toBeCloseToWithDigit: (t<float>, float, int) => unit = "toBeCloseTo"

  @send external toBeDefined: t<'a> => unit = "toBeDefined"
  @send external toBeFalsy: t<'a> => unit = "toBeFalsy"
  @send external toBeTruthy: t<'a> => unit = "toBeTruthy"

  @send external toBeGreaterThan: (t<int>, int) => unit = "toBeGreaterThan"
  @send external toBeGreaterThanOrEqual: (t<int>, int) => unit = "toBeGreaterThanOrEqual"
  @send external toBeGreaterThanFloat: (t<float>, float) => unit = "toBeGreaterThan"
  @send
  external toBeGreaterThanOrEqualFloat: (t<float>, float) => unit = "toBeGreaterThanOrEqual"

  @send external toBeLessThan: (t<int>, int) => unit = "toBeLessThan"
  @send external toBeLessThanOrEqual: (t<int>, int) => unit = "toBeLessThanOrEqual"
  @send external toBeLessThanFloat: (t<float>, float) => unit = "toBeLessThan"
  @send external toBeLessThanOrEqualFloat: (t<float>, float) => unit = "toBeLessThanOrEqual"

  @send external toBeNull: t<Js.Nullable.t<'a>> => unit = "toBeNull"
  @send external toBeUndefined: t<Js.Undefined.t<'a>> => unit = "toBeUndefined"

  @send external toBeNaN: t<int> => unit = "toBeNaN"
  @send external toBeNaNFloat: t<float> => unit = "toBeNaN"

  @send external toContain: (t<array<'a>>, 'a) => unit = "toContain"
  @send external toContainEqual: (t<array<'a>>, 'a) => unit = "toContainEqual"

  @send external toHaveLength: (t<array<'a>>, int) => unit = "toHaveLength"
  @send external toHaveProperty: (t<'a>, string) => unit = "toHaveProperty"
  @send external toHavePropertyValue: (t<'a>, string, 'b) => unit = "toHaveProperty"

  @send external toMatch: (t<string>, Js.Re.t) => unit = "toMatch"
  @send external toMatchString: (t<string>, string) => unit = "toMatch"

  @send external toMatchObject: (t<'a>, {..}) => unit = "toMatchObject"

  @send external toMatchSnapshot: t<'a> => unit = "toMatchSnapshot"
  @send external toMatchInlineSnapshot: t<'a> => unit = "toMatchInlineSnapshot"

  @send external toThrow: t<unit => unit> => unit = "toThrow"
  @send external toThrowError: (t<unit => unit>, Js.Exn.t) => unit = "toThrow"
}

@module("@jest/globals") external expect: 'a => Expect.t<'a> = "expect"

// Jest Module
module JestJs = {
  // mock packages
  @module("@jest/globals") @scope("jest") external dontMock: string => unit = "dontMock"
  @module("@jest/globals") @scope("jest") external doMock: string => unit = "doMock"
  @module("@jest/globals") @scope("jest")
  external doMockFactory: (string, unit => 'a) => unit = "doMock"
  @module("@jest/globals") @scope("jest")
  external doMockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit =
    "doMock"

  @module("@jest/globals") @scope("jest") external mock: string => unit = "mock"
  @module("@jest/globals") @scope("jest")
  external mockFactory: (string, unit => 'a) => unit = "mock"
  @module("@jest/globals") @scope("jest")
  external mockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit = "mock"

  @module("@jest/globals") @scope("jest") external requireActual: string => 'a = "requireActual"
  @module("@jest/globals") @scope("jest") external requireMock: string => 'a = "requireMock"

  // global functions
  @module("@jest/globals") @scope("jest") external autoMockOff: unit => unit = "autoMockOff"
  @module("@jest/globals") @scope("jest") external autoMockOn: unit => unit = "autoMockOn"
  @module("@jest/globals") @scope("jest") external clearAllMocks: unit => unit = "clearAllMocks"
  @module("@jest/globals") @scope("jest") external resetAllMocks: unit => unit = "resetAllMocks"
  @module("@jest/globals") @scope("jest") external restoreAllMocks: unit => unit = "restoreAllMocks"
  @module("@jest/globals") @scope("jest") external clearAllTimers: unit => unit = "clearAllTimers"
  @module("@jest/globals") @scope("jest") external getTimerCount: unit => unit = "getTimerCount"
  @module("@jest/globals") @scope("jest") external setSystemTime: int => unit = "setSystemTime"
  @module("@jest/globals") @scope("jest")
  external setSystemDate: Js.Date.t => unit = "setSystemTime"
  @module("@jest/globals") @scope("jest")
  external getRealSystemTime: unit => int = "getRealSystemTime"
  @module("@jest/globals") @scope("jest") external disableAutomock: unit => unit = "disableAutomock"
  @module("@jest/globals") @scope("jest") external enableAutomock: unit => unit = "enableAutomock"
  @module("@jest/globals") @scope("jest") external resetModules: unit => unit = "resetModules"
  @module("@jest/globals") @scope("jest")
  external runAllImmediates: unit => unit = "runAllImmediates"
  @module("@jest/globals") @scope("jest") external runAllTicks: unit => unit = "runAllTicks"
  @module("@jest/globals") @scope("jest") external runAllTimers: unit => unit = "runAllTimers"
  @module("@jest/globals") @scope("jest")
  external runOnlyPendingTimers: unit => unit = "runOnlyPendingTimers"
  @module("@jest/globals") @scope("jest")
  external advanceTimersByTime: int => unit = "advanceTimersByTime"
  @module("@jest/globals") @scope("jest")
  external advanceTimersToNextTimer: int => unit = "advanceTimersToNextTimer"
  @module("@jest/globals") @scope("jest") external setTimeout: int => unit = "setTimeout"
  @module("@jest/globals") @scope("jest") external useFakeTimers: unit => unit = "useFakeTimers"
  @module("@jest/globals") @scope("jest") external useRealTimers: unit => unit = "useRealTimers"

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
  @module("@jest/globals") @scope("jest")
  external useFakeTimersWithConfig: fakeTimerConfig => unit = "useFakeTimers"
}
