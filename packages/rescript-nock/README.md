# `rescript-nock`

ReScript binding of [nock](https://github.com/nock/nock)

## Install

```bash
npm i @greenlabs/rescript-nock --save-dev
or
yarn add @greenlabs/rescript-nock --dev
```

```json
"bs-dev-dependencies": [
  "@greenlabs/rescript-nock"
]
```

## Usage

With [rescript-jest](https://github.com/green-labs/rescript-bindings/packages/rescript-jest)

```rescript
open Jest
open Expect

describe("Test my module", () => {
  let setupNetworkScope = Nock.make("https://greenlabs.co.kr")
    ->Nock.get("/api/communities")
    ->Nock.replyAny(200, {
      "result": "OK"
    })
  describe("When call setup", () => {
    testPromise("Should network is mocked", () => {
      let scope = setupNetworkScope()

      Fetch.fetch("https://greenlabs.co.kr/api/communities")
      ->Promise.then(response => response->Fetch.Response.json)
      ->Promise.thenResolve(response => {
        expect(
          response
          ->Js.Json.decodeObject
          ->Belt.Option.flatMap(
            object => object->Js.Dict.get("result")->Belt.Option.flatMap(Js.Json.decodeString),
          ),
        )->toBe(Some("OK"))
        scope->Nock.done
      })
    })
  })
  
})
```