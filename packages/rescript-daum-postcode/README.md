# 다음 주소 검색 리스크립트 바인딩

`rescript-daum-postcode`는 [다음 주소 검색](https://postcode.map.daum.net/guide) 자바스크립트 모듈의 리스크립트(ReScript) 바인딩 입니다.

## 설치하기

> ReScript 버전 호환 표

| Compiler | res_daum_postcode |
| -------- | ----------------- |
| v12      | >= v0.2.1         |
| v11      | >= v0.2.0         |
| v10      | ~<= v0.1.2        |

1. 모듈 설치

```shell
npm i @greenlabs/rescript-daum-postcode
or
yarn add @greenlabs/rescript-daum-postcode
```

2. `rescript.json` 의존성 추가하기

```json
"bs-dependencies": [
  "@greenlabs/rescript-daum-postcode"
]
```

## 사용방법

```rescript
open DaumPostCode

let daumPostCode = make({
  oncomplete: data => data->Js.Console.log,
  onresize: size => size->Js.Console.log,
  onclose: state =>
    switch state {
    | FORCE_CLOSE => "fc"->Js.Console.log
    | COMPLETE_CLOSE => "cc"->Js.Console.log
    },
  onsearch: data => data->Js.Console.log,
  width: 500.0,
  height: 700.0,
})

// 팝업 방식
daumPostCode->openPostCode({
  q: "문정동",
  left: 100.0,
  top: 200.0,
  popupName: "주소검색",
  autoClose: true,
})

// 임베드 방식
open Webapi

let div = Dom.document |> Dom.Document.getElementById("search-address")
div->Belt.Option.map(el => daumPostCode->embedPostCode(el, {
  q: "문정동",
  autoClose: true
}))->ignore
```

## API

[다음 주소 검색 API](https://postcode.map.daum.net/guide#attributes)
