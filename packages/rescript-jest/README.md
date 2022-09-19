# `rescript-jest`

## Install

```bash
npm i @greenlabs/rescript-jest
or
yarn add @greenlabs/rescript-jest
```

```json
"bs-dev-dependencies": [
  "@greenlabs/rescript-jest"
]
```

## Usage

```rescript
open Jest
open Expect

describe("Test my module", () => {
  let myMockFunction = JestJs.make2((msg, msg2) => msg ++ msg2)
  let setup = () => {
    (myMockFunction->Mock.fn)("Hello ", "world!")
  }
  describe("When call setup", () => {
    beforeEach(() => {
      setup()
    })

    afterEach(() => {
      myMockFunction->Mock.mockClear
    })

    test("myFunction is should called", () => {
      expect(myMockFunction).toBeCalled()
      expect(myMockFunction).toBeCalledTimes(1)
    })

    test("myFunction is should called with 'Hello ', 'world!'", () => {
      expect(myMockFunction).toBeCalledWith(("Hello ", "world!"))
    })

    test("myFunction return is 'Hello world!'", () => {
      expect(myMockFunction).toReturnedWith("Hello world!")
    })
  })
  
})
```