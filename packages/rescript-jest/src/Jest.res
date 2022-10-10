type finishFn = @uncurry (unit => unit)

// Global Functions
external describe: (string, @uncurry (unit => unit)) => unit = "describe"

module Describe = {
  @scope("describe")
  external only: (string, @uncurry (unit => unit)) => unit = "only"

  @scope("describe")
  external skip: (string, @uncurry (unit => unit)) => unit = "skip"

  @scope("describe")
  external each1: (array<'a>, . string, 'a => unit) => unit = "each"
  @scope("describe")
  external each2: (array<('a, 'b)>, . string, ('a, 'b) => unit) => unit = "each"
  @scope("describe")
  external each3: (array<('a, 'b, 'c)>, . string, ('a, 'b, 'c) => unit) => unit = "each"
  @scope("describe")
  external each4: (array<('a, 'b, 'c, 'd)>, . string, ('a, 'b, 'c, 'd) => unit) => unit = "each"
  @scope("describe")
  external each5: (array<('a, 'b, 'c, 'd, 'e)>, . string, ('a, 'b, 'c, 'd, 'e) => unit) => unit =
    "each"
}

external test: (string, @uncurry (unit => unit)) => unit = "test"

external testPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "test"
external testPromiseTimeout: (string, @uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "test"
external testAsync: (string, finishFn => unit) => unit = "test"
external testAsyncTimeout: (string, @uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "test"

// test closure
module Test = {
  external it: (string, @uncurry (unit => unit)) => unit = "test"

  external itPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "test"
  external itPromiseTimeout: (string, @uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
    "test"
  external itAsync: (string, finishFn => unit) => unit = "test"
  external itAsyncTimeout: (string, finishFn => unit, ~timeout: int) => unit = "test"

  @scope("test")
  external only: (string, @uncurry (unit => unit)) => unit = "only"
  @scope("test")
  external onlyPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "only"
  @scope("test")
  external onlyPromiseTimeout: (
    string,
    @uncurry (unit => Js.Promise.t<'a>),
    ~timeout: int,
  ) => unit = "only"
  @scope("test")
  external onlyAsync: (string, finishFn => unit) => unit = "only"
  @scope("test")
  external onlyAsyncTimeout: (string, finishFn => unit, ~timeout: int) => unit = "only"

  @scope("test")
  external failing: (string, @uncurry (unit => unit)) => unit = "failing"
  @scope("test")
  external failingPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "failing"
  @scope("test")
  external failingPromiseTimeout: (
    string,
    @uncurry (unit => Js.Promise.t<'a>),
    ~timeout: int,
  ) => unit = "failing"
  @scope("test")
  external failingAsync: (string, finishFn => unit) => unit = "failing"
  @scope("test")
  external failingAsyncTimeout: (string, finishFn => unit, ~timeout: int) => unit = "failing"

  @scope("test")
  external skip: (string, @uncurry (unit => unit)) => unit = "skip"
  @scope("test")
  external skipPromise: (string, @uncurry (unit => Js.Promise.t<'a>)) => unit = "skip"
  @scope("test")
  external skipPromiseTimeout: (
    string,
    @uncurry (unit => Js.Promise.t<'a>),
    ~timeout: int,
  ) => unit = "skip"
  @scope("test")
  external skipAsync: (string, finishFn => unit) => unit = "skip"
  @scope("test")
  external skipAsyncTimeout: (string, finishFn => unit, ~timeout: int) => unit = "skip"

  @scope("test") external todo: string => unit = "todo"

  @scope("test")
  external each1: (array<'a>, . string, 'a => unit) => unit = "each"
  @scope("test")
  external each2: (array<('a, 'b)>, . string, ('a, 'b) => unit) => unit = "each"
  @scope("test")
  external each3: (array<('a, 'b, 'c)>, . string, ('a, 'b, 'c) => unit) => unit = "each"
  @scope("test")
  external each4: (array<('a, 'b, 'c, 'd)>, . string, ('a, 'b, 'c, 'd) => unit) => unit = "each"
  @scope("test")
  external each5: (array<('a, 'b, 'c, 'd, 'e)>, . string, ('a, 'b, 'c, 'd, 'e) => unit) => unit =
    "each"

  @scope("test")
  external eachPromise1: (array<'a>, . string, 'a => Js.Promise.t<unit>) => unit = "each"
  @scope("test")
  external eachPromise2: (array<('a, 'b)>, . string, ('a, 'b) => Js.Promise.t<unit>) => unit =
    "each"
  @scope("test")
  external eachPromise3: (
    array<('a, 'b, 'c)>,
    . string,
    ('a, 'b, 'c) => Js.Promise.t<unit>,
  ) => unit = "each"
  @scope("test")
  external eachPromise4: (
    array<('a, 'b, 'c, 'd)>,
    . string,
    ('a, 'b, 'c, 'd) => Js.Promise.t<unit>,
  ) => unit = "each"
  @scope("test")
  external eachPromise5: (
    array<('a, 'b, 'c, 'd, 'e)>,
    . string,
    ('a, 'b, 'c, 'd, 'e) => Js.Promise.t<unit>,
  ) => unit = "each"

  @scope("test")
  external eachPromise1Timeout: (
    array<'a>,
    . string,
    'a => Js.Promise.t<unit>,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachPromise2Timeout: (
    array<('a, 'b)>,
    . string,
    ('a, 'b) => Js.Promise.t<unit>,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachPromise3Timeout: (
    array<('a, 'b, 'c)>,
    . string,
    ('a, 'b, 'c) => Js.Promise.t<unit>,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachPromise4Timeout: (
    array<('a, 'b, 'c, 'd)>,
    . string,
    ('a, 'b, 'c, 'd) => Js.Promise.t<unit>,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachPromise5Timeout: (
    array<('a, 'b, 'c, 'd, 'e)>,
    . string,
    ('a, 'b, 'c, 'd, 'e) => Js.Promise.t<unit>,
    ~timeout: int,
  ) => unit = "each"

  @scope("test")
  external eachAsync1: (array<'a>, . string, ('a, finishFn) => unit) => unit = "each"
  @scope("test")
  external eachAsync2: (array<('a, 'b)>, . string, ('a, 'b, finishFn) => unit) => unit = "each"
  @scope("test")
  external eachAsync3: (array<('a, 'b, 'c)>, . string, ('a, 'b, 'c, finishFn) => unit) => unit =
    "each"
  @scope("test")
  external eachAsync4: (
    array<('a, 'b, 'c, 'd)>,
    . string,
    ('a, 'b, 'c, 'd, finishFn) => unit,
  ) => unit = "each"
  @scope("test")
  external eachAsync5: (
    array<('a, 'b, 'c, 'd, 'e)>,
    . string,
    ('a, 'b, 'c, 'd, 'e, finishFn) => unit,
  ) => unit = "each"

  @scope("test")
  external eachAsync1Timeout: (array<'a>, . string, ('a, finishFn) => unit, ~timeout: int) => unit =
    "each"
  @scope("test")
  external eachAsync2Timeout: (
    array<('a, 'b)>,
    . string,
    ('a, 'b, finishFn) => unit,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachAsync3Timeout: (
    array<('a, 'b, 'c)>,
    . string,
    ('a, 'b, 'c, finishFn) => unit,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachAsync4Timeout: (
    array<('a, 'b, 'c, 'd)>,
    . string,
    ('a, 'b, 'c, 'd, finishFn) => unit,
    ~timeout: int,
  ) => unit = "each"
  @scope("test")
  external eachAsync5Timeout: (
    array<('a, 'b, 'c, 'd, 'e)>,
    . string,
    ('a, 'b, 'c, 'd, 'e, finishFn) => unit,
    ~timeout: int,
  ) => unit = "each"
}

external beforeEach: (@uncurry (unit => unit)) => unit = "beforeEach"

external beforeEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeEach"
external beforeEachPromiseTimeout: (@uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "beforeEach"
external beforeEachAsync: (finishFn => unit) => unit = "beforeEach"
external beforeEachAsyncTimeout: (finishFn => unit, ~timeout: int) => unit = "beforeEach"

external beforeAll: (@uncurry (unit => unit)) => unit = "beforeAll"

external beforeAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "beforeAll"
external beforeAllPromiseTimeout: (@uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "beforeAll"
external beforeAllAsync: (finishFn => unit) => unit = "beforeAll"
external beforeAllAsyncTimeout: (finishFn => unit, ~timeout: int) => unit = "beforeAll"

external afterEach: (@uncurry (unit => unit)) => unit = "afterEach"

external afterEachPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterEach"
external afterEachPromiseTimeout: (@uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "afterEach"
external afterEachAsync: (finishFn => unit) => unit = "afterEach"
external afterEachAsyncTimeout: (finishFn => unit, ~timeout: int) => unit = "afterEach"

external afterAll: (@uncurry (unit => unit)) => unit = "afterAll"

external afterAllPromise: (@uncurry (unit => Js.Promise.t<'a>)) => unit = "afterAll"
external afterAllPromiseTimeout: (@uncurry (unit => Js.Promise.t<'a>), ~timeout: int) => unit =
  "afterAll"
external afterAllAsync: (finishFn => unit) => unit = "afterAll"
external afterAllAsyncTimeout: (finishFn => unit, ~timeout: int) => unit = "afterAll"

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
  @send external mockReturnValue: (t<_, _, 'return>, 'return) => unit = "mockReturnValue"
  @send external mockReturnValueOnce: (t<_, _, 'return>, 'return) => unit = "mockReturnValueOnce"
  @send
  external mockResolvedValue: (t<_, _, Js.Promise.t<'return>>, 'return) => unit =
    "mockResolvedValue"
  @send
  external mockResolvedValueOnce: (t<_, _, Js.Promise.t<'return>>, 'return) => unit =
    "mockResolvedValueOnce"
  @send external mockRejectedValue: (t<_, _, _>, 'b) => unit = "mockRejectedValue"
  @send external mockRejectedValueOnce: (t<_, _, _>, 'b) => unit = "mockRejectedValueOnce"
}

type expect<'r, 'expect_ret>
module Expect = {
  @get external not: expect<'value, 'expect_ret> => expect<'value, 'expect_ret> = "not"
  @get external unsafe: expect<'value, 'expect_ret> => expect<'b, 'expect_ret> = "%identity"

  @get
  external resolves: expect<Js.Promise.t<'value>, 'expect_ret> => expect<
    'value,
    Js.Promise.t<unit>,
  > = "resolves"
  @get
  external rejects: expect<Js.Promise.t<'value>, 'expect_ret> => expect<
    'error,
    Js.Promise.t<unit>,
  > = "rejects"

  @send external toBe: (expect<'value, 'expect_ret>, 'value) => 'expect_ret = "toBe"
  @send external toEqual: (expect<'value, 'expect_ret>, 'value) => 'expect_ret = "toEqual"
  @send
  external toStrictEqual: (expect<'value, 'expect_ret>, 'value) => 'expect_ret = "toStrictEqual"

  let toHaveBeenLastCalledWith: (
    expect<Mock.t<_, 'arg, _>, 'expect_ret>,
    'arg,
  ) => 'expect_ret = %raw(`function (fn, args) {
    return expect(fn).toHaveBeenLastCalledWith(...(Array.isArray(args) ? args : [args]));
  }`)

  @send
  external toHaveBeenLastCalledWith1: (
    expect<Mock.t<_, 'arg1, _>, 'expect_ret>,
    'arg1,
  ) => 'expect_ret = "toHaveBeenLastCalledWith"
  @send
  external toHaveBeenLastCalledWith2: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    'arg1,
    'arg2,
  ) => 'expect_ret = "toHaveBeenLastCalledWith"
  @send
  external toHaveBeenLastCalledWith3: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
  ) => 'expect_ret = "toHaveBeenLastCalledWith"
  @send
  external toHaveBeenLastCalledWith4: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
  ) => 'expect_ret = "toHaveBeenLastCalledWith"
  @send
  external toHaveBeenLastCalledWith5: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4, 'arg5), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
    'arg5,
  ) => 'expect_ret = "toHaveBeenLastCalledWith"

  @send
  external toHaveLastReturnedWith: (
    expect<Mock.t<_, _, 'return>, 'expect_ret>,
    'return,
  ) => 'expect_ret = "toHaveLastReturnedWith"

  /** Warning: if your mock function argument length is 1 and type is array, use 'toHaveBeenNthCalledWith1' safety */
  let toHaveBeenNthCalledWith: (
    expect<Mock.t<_, 'arg, _>, 'expect_ret>,
    int,
    'arg,
  ) => 'expect_ret = %raw(`function (fn, nth, args) {
    return expect(fn).toHaveBeenNthCalledWith(nth, ...(Array.isArray(args) ? args : [args]));
  }`)

  @send
  external toHaveBeenNthCalledWith1: (
    expect<Mock.t<_, 'arg1, _>, 'expect_ret>,
    int,
    'arg1,
  ) => 'expect_ret = "toHaveBeenNthCalledWith"
  @send
  external toHaveBeenNthCalledWith2: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    int,
    'arg1,
    'arg2,
  ) => 'expect_ret = "toHaveBeenNthCalledWith"
  @send
  external toHaveBeenNthCalledWith3: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    int,
    'arg1,
    'arg2,
    'arg3,
  ) => 'expect_ret = "toHaveBeenNthCalledWith"
  @send
  external toHaveBeenNthCalledWith4: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4), _>, 'expect_ret>,
    int,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
  ) => 'expect_ret = "toHaveBeenNthCalledWith"
  @send
  external toHaveBeenNthCalledWith5: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4, 'arg5), _>, 'expect_ret>,
    int,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
    'arg5,
  ) => 'expect_ret = "toHaveBeenNthCalledWith"

  @send
  external toHaveNthReturnedWith: (
    expect<Mock.t<_, _, 'return>, 'expect_ret>,
    int,
    'return,
  ) => 'expect_ret = "toHaveNthReturnedWith"

  @send external toBeCalled: expect<Mock.t<_, _, _>, 'expect_ret> => 'expect_ret = "toBeCalled"
  @send
  external toBeCalledTimes: (expect<Mock.t<_, _, _>, 'expect_ret>, int) => 'expect_ret =
    "toBeCalledTimes"

  /** Warning: if your mock function argument length is 1 and type is array, use 'toHaveBeenCalledWith1' safety */
  let toHaveBeenCalledWith: (
    expect<Mock.t<_, 'arg, _>, 'expect_ret>,
    'arg,
  ) => 'expect_ret = %raw(`function (fn, args) {
    return expect(fn).toHaveBeenCalledWith(...(Array.isArray(args) ? args : [args]));
  }`)

  @send
  external toHaveBeenCalledWith1: (expect<Mock.t<_, 'arg1, _>, 'expect_ret>, 'arg1) => 'expect_ret =
    "toHaveBeenCalledWith"
  @send
  external toHaveBeenCalledWith2: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    'arg1,
    'arg2,
  ) => 'expect_ret = "toHaveBeenCalledWith"
  @send
  external toHaveBeenCalledWith3: (
    expect<Mock.t<_, ('arg1, 'arg2), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
  ) => 'expect_ret = "toHaveBeenCalledWith"
  @send
  external toHaveBeenCalledWith4: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
  ) => 'expect_ret = "toHaveBeenCalledWith"
  @send
  external toHaveBeenCalledWith5: (
    expect<Mock.t<_, ('arg1, 'arg2, 'arg3, 'arg4, 'arg5), _>, 'expect_ret>,
    'arg1,
    'arg2,
    'arg3,
    'arg4,
    'arg5,
  ) => 'expect_ret = "toHaveBeenCalledWith"

  @send
  external toHaveReturned: expect<Mock.t<_, _, _>, 'expect_ret> => 'expect_ret = "toHaveReturned"

  @send
  external toHaveReturnedWith: (
    expect<Mock.t<_, _, 'return>, 'expect_ret>,
    'return,
  ) => 'expect_ret = "toHaveReturnedWith"

  @send external toBeCloseTo: (expect<float, 'expect_ret>, float) => 'expect_ret = "toBeCloseTo"
  @send
  external toBeCloseToWithDigit: (expect<float, 'expect_ret>, float, int) => 'expect_ret =
    "toBeCloseTo"

  @send external toBeDefined: expect<'value, 'expect_ret> => 'expect_ret = "toBeDefined"
  @send external toBeFalsy: expect<'value, 'expect_ret> => 'expect_ret = "toBeFalsy"
  @send external toBeTruthy: expect<'value, 'expect_ret> => 'expect_ret = "toBeTruthy"

  @send external toBeGreaterThan: (expect<int, 'expect_ret>, int) => 'expect_ret = "toBeGreaterThan"
  @send
  external toBeGreaterThanOrEqual: (expect<int, 'expect_ret>, int) => 'expect_ret =
    "toBeGreaterThanOrEqual"
  @send
  external toBeGreaterThanFloat: (expect<float, 'expect_ret>, float) => 'expect_ret =
    "toBeGreaterThan"
  @send
  external toBeGreaterThanOrEqualFloat: (expect<float, 'expect_ret>, float) => 'expect_ret =
    "toBeGreaterThanOrEqual"

  @send external toBeLessThan: (expect<int, 'expect_ret>, int) => 'expect_ret = "toBeLessThan"
  @send
  external toBeLessThanOrEqual: (expect<int, 'expect_ret>, int) => 'expect_ret =
    "toBeLessThanOrEqual"
  @send
  external toBeLessThanFloat: (expect<float, 'expect_ret>, float) => 'expect_ret = "toBeLessThan"
  @send
  external toBeLessThanOrEqualFloat: (expect<float, 'expect_ret>, float) => 'expect_ret =
    "toBeLessThanOrEqual"

  @send external toBeNull: expect<Js.Nullable.t<'value>, 'expect_ret> => 'expect_ret = "toBeNull"
  @send
  external toBeUndefined: expect<Js.Undefined.t<'value>, 'expect_ret> => 'expect_ret =
    "toBeUndefined"

  @send external toBeNaN: expect<int, 'expect_ret> => 'expect_ret = "toBeNaN"
  @send external toBeNaNFloat: expect<float, 'expect_ret> => 'expect_ret = "toBeNaN"

  @send
  external toContain: (expect<array<'value>, 'expect_ret>, 'value) => 'expect_ret = "toContain"
  @send
  external toContainEqual: (expect<array<'value>, 'expect_ret>, 'value) => 'expect_ret =
    "toContainEqual"

  @send
  external toHaveLength: (expect<array<'value>, 'expect_ret>, int) => 'expect_ret = "toHaveLength"
  @send
  external toHaveProperty: (expect<'value, 'expect_ret>, string) => 'expect_ret = "toHaveProperty"
  @send
  external toHavePropertyValue: (expect<'value, 'expect_ret>, string, 'b) => 'expect_ret =
    "toHaveProperty"

  @send external toMatch: (expect<string, 'expect_ret>, Js.Re.t) => 'expect_ret = "toMatch"
  @send external toMatchString: (expect<string, 'expect_ret>, string) => 'expect_ret = "toMatch"

  @send external toMatchObject: (expect<'value, 'expect_ret>, {..}) => 'expect_ret = "toMatchObject"

  @send external toMatchSnapshot: expect<'value, 'expect_ret> => 'expect_ret = "toMatchSnapshot"
  @send
  external toMatchInlineSnapshot: expect<'value, 'expect_ret> => 'expect_ret =
    "toMatchInlineSnapshot"

  @send external toThrow: expect<'value, 'expect_ret> => 'expect_ret = "toThrow"
  @send external toThrowString: (expect<'value, 'expect_ret>, string) => 'expect_ret = "toThrow"
  @send external toThrowRegexp: (expect<'value, 'expect_ret>, Js.Re.t) => 'expect_ret = "toThrow"
  @send external toThrowError: (expect<'value, 'expect_ret>, Js.Exn.t) => 'expect_ret = "toThrow"
}

external expect: 'value => expect<'value, unit> = "expect"

module ExpectStatic = {
  @scope("expect") external anything: unit => 'a = "anything"
  let anyInt: unit => int = %raw(`function () { return expect.any(Number) }`)
  let anyFloat: unit => float = %raw(`function () { return expect.any(Number) }`)
  let anyString: unit => float = %raw(`function () { return expect.any(String) }`)

  @scope("expect") external any: 'b => 'a = "any"

  @scope("expect") external arrayContaining: array<'a> => array<'a> = "arrayContaining"
  @scope("expect") external objectContaining: {..} => 'a = "objectContaining"
  @scope("expect") external stringContaining: string => string = "stringContaining"
  @scope("expect") external stringMatching: Js.Re.t => string = "stringMatching"

  @scope(("expect", "not")) external notArrayContaining: array<'a> => array<'a> = "arrayContaining"
  @scope(("expect", "not")) external notObjectContaining: {..} => 'a = "objectContaining"
  @scope(("expect", "not")) external notStringContaining: string => string = "stringContaining"
  @scope(("expect", "not")) external notStringMatching: Js.Re.t => string = "stringMatching"

  @scope("expect") external closeTo: float => float = "closeTo"
  @scope("expect") external closeToWithDigit: (float, int) => float = "closeTo"

  @scope("expect") external assertions: int => unit = "assertions"
  @scope("expect") external hasAssertions: unit => unit = "hasAssertions"
}

// Jest Module
module JestJs = {
  external require: string => 'a = "require"
  @scope("jest") external requireActual: string => 'a = "requireActual"
  @scope("jest") external requireMock: string => 'a = "requireMock"

  // mock packages
  @scope("jest") external mock: string => unit = "mock"
  @scope("jest")
  external mockFactoryUnsafe: (string, unit => 'a) => unit = "mock"

  type factoryResult<'mod> =
    Default('mod) | EsModule('mod) | WithActual('mod) | WithActualEsModule('mod)
  let mockFactory = (name: string, callback: unit => factoryResult<'mod>) => {
    mockFactoryUnsafe(name, () => {
      switch callback() {
      | Default(mod) => mod
      | EsModule(mod) => Js.Obj.assign({"__esModule": true}, mod)
      | WithActual(mod) => Js.Obj.assign(requireActual(name), mod)
      | WithActualEsModule(mod) =>
        Js.Obj.assign({"__esModule": true}, requireActual(name))->Js.Obj.assign(mod)
      }
    })
  }

  @scope("jest")
  external mockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit = "mock"

  @scope("jest") external dontMock: string => unit = "dontMock"
  @scope("jest") external doMock: string => unit = "doMock"
  @scope("jest")
  external doMockFactoryUnsafe: (string, unit => 'a) => unit = "doMock"
  let doMockFactory = (name: string, callback: unit => factoryResult<'mod>) => {
    doMockFactoryUnsafe(name, () => {
      switch callback() {
      | Default(mod) => mod
      | EsModule(mod) => Js.Obj.assign({"__esModule": true}, mod)
      | WithActual(mod) => Js.Obj.assign(requireActual(name), mod)
      | WithActualEsModule(mod) =>
        Js.Obj.assign({"__esModule": true}, requireActual(name))->Js.Obj.assign(mod)
      }
    })
  }
  @scope("jest")
  external doMockFactoryVirtual: (string, unit => 'a, @as(json`{virtual: true }`) _) => unit =
    "doMock"

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

  @scope("jest") external isolateModules: (@uncurry unit => unit) => unit = "isolateModules"

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
