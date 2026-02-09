# 카카오 주소 검색 리스크립트 바인딩

`rescript-kakao-postcode`는 [카카오 주소 검색](https://postcode.map.kakao.com/guide) 자바스크립트 모듈의 리스크립트(ReScript) 바인딩 입니다.

> 기존 `@greenlabs/rescript-daum-postcode` 패키지의 서비스 도메인이 변경됨에 따라 새롭게 만들어진 패키지입니다.

## 설치하기

> ReScript 버전 호환 표

| Compiler | rescript_kakao_postcode |
| -------- | ---------------------- |
| v12      | >= v0.1.0              |

1. 모듈 설치

```shell
npm i @greenlabs/rescript-kakao-postcode
or
yarn add @greenlabs/rescript-kakao-postcode
```

2. `rescript.json` 의존성 추가하기

```json
"dependencies": [
  "@greenlabs/rescript-kakao-postcode"
]
```

## 사용방법

```rescript
open KakaoPostCode

let kakaoPostCode = make({
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
kakaoPostCode->openPostCode({
  q: "문정동",
  left: 100.0,
  top: 200.0,
  popupName: "주소검색",
  autoClose: true,
})

// 임베드 방식
open Webapi

let div = Dom.document |> Dom.Document.getElementById("search-address")
div->Belt.Option.map(el => kakaoPostCode->embedPostCode(el, {
  q: "문정동",
  autoClose: true
}))->ignore
```

## API

[카카오 주소 검색 API](https://postcode.map.kakao.com/guide#attributes)
