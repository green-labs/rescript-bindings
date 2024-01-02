open! Jest
open! Expect

describe("Jest", () => {
  describe("Test.each1", () => {
    (Test.each1(["hello", "world"], ...))(.
      "message: %s",
      str => {
        Js.log(str)
      },
    )
  })

  describe("Test.each2", () => {
    (Test.each2([("hello", "world"), ("green", "labs")], ...))(.
      "message: %s",
      (str1, str2) => {
        Js.log2(str1, str2)
      },
    )
  })

  testPromise("expect.resolves", () => {
    expect(Js.Promise.resolve("Hello"))->resolves->toBe("Hello")
  })

  test("Moke.make function", () => {
    let mock = Mock.make(str => str ++ "")

    (mock->Mock.fn)("Hello")->ignore
    (mock->Mock.fn)("Green")->ignore
    (mock->Mock.fn)("Last")->ignore

    expect(mock)->toBeCalled
    expect(mock)->toBeCalledTimes(3)

    expect(mock)->toHaveBeenNthCalledWith(0, "Hello")
    expect(mock)->toHaveNthReturnedWith(0, "Hello")

    expect(mock)->toHaveBeenNthCalledWith(1, "Green")
    expect(mock)->toHaveNthReturnedWith(1, "Green")

    expect(mock)->toHaveBeenLastCalledWith("Last")
    expect(mock)->toHaveLastReturnedWith("Last")
  })

  test("Moke.make2 function", () => {
    let mock = Mock.make2((str, str2) => str ++ str2)

    (mock->Mock.fn)("Hello ", "World")->ignore
    (mock->Mock.fn)("Green ", "Labs")->ignore
    (mock->Mock.fn)("Last ", "Calls")->ignore

    expect(mock)->toBeCalled
    expect(mock)->toBeCalledTimes(3)

    expect(mock)->toHaveBeenNthCalledWith(0, ("Hello ", "World"))
    expect(mock)->toHaveNthReturnedWith(0, "Hello World")

    expect(mock)->toHaveBeenNthCalledWith(1, ("Green ", "Labs"))
    expect(mock)->toHaveNthReturnedWith(1, "Green Labs")

    expect(mock)->toHaveBeenLastCalledWith(("Last ", "Calls"))
    expect(mock)->toHaveLastReturnedWith("Last Calls")
  })

  test("expect.unsafe function", () => {
    expect(1)->not->unsafe->toBe(true)
    expect(1)->not->unsafe->toEqual([1, 2, 3])
  })

  describe("isolateModules", () => {
    let myModule = ref(None)
    JestJs.isolateModules(
      () => {
        myModule := Some(JestJs.require("./module.js"))
      },
    )
    let otherCopyOfMyModule = JestJs.require("./module.js")
    otherCopyOfMyModule->ignore
  })
})
