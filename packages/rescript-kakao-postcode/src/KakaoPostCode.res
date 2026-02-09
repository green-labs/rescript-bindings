type t
type addressType = R | J // R 도로명 | J 지번
type selected = Y | N // 선택 상태
type lang = K | E // K 한글주소 | E 영문주소

type oncompleteResponse = {
  address: string,
  addressEnglish: string,
  addressType: addressType,
  apartment: selected,
  autoJibunAddress: string,
  autoJibunAddressEnglish: string,
  autoRoadAddress: string,
  autoRoadAddressEnglish: string,
  bcode: string,
  bname: string,
  bname1: string,
  bname1English: string,
  bname2: string,
  bname2English: string,
  bnameEnglish: string,
  buildingCode: string,
  buildingName: string,
  hname: string,
  jibunAddress: string,
  jibunAddressEnglish: string,
  noSelected: selected,
  postcode: string,
  postcode1: string,
  postcode2: string,
  postcodeSeq: string,
  query: string,
  roadAddress: string,
  roadAddressEnglish: string,
  roadname: string,
  roadnameCode: string,
  roadnameEnglish: string,
  sido: string,
  sidoEnglish: string,
  sigungu: string,
  sigunguCode: string,
  sigunguEnglish: string,
  userLanguageType: lang,
  userSelectedType: addressType,
  zonecode: string,
}
type onresizeResponse = {
  width: float,
  height: float,
}
type oncloseResponse = FORCE_CLOSE | COMPLETE_CLOSE
type onsearchResponse = {q: string, count: int}

type themeObj = {
  bgColor?: string, // 바탕 배경색
  searchBgColor?: string, // 검색창 배경색
  contentBgColor?: string, // 본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
  pageBgColor?: string, // 페이지 배경색
  textColor?: string, // 기본 글자색
  queryTextColor?: string, // 검색창 글자색
  postcodeTextColor?: string, // 우편번호 글자색
  emphTextColor?: string, // 강조 글자색
  outlineColor?: string, // 테두리
}

type params = {
  oncomplete?: oncompleteResponse => unit,
  onresize?: onresizeResponse => unit,
  onclose?: oncloseResponse => unit,
  onsearch?: onsearchResponse => unit,
  width?: float,
  height?: float,
  animation?: bool,
  focusInput?: bool,
  autoMapping?: bool,
  shorthand?: bool,
  pleaseReadGuide?: int,
  pleaseReadGuideTimer?: float,
  maxSuggestItems?: int,
  showMoreHName?: bool,
  hideMapBtn?: bool,
  hideEngBtn?: bool,
  alwaysShowEngAddr?: bool,
  useBannerLink?: bool,
  theme?: themeObj,
  submitMode?: bool,
}

@new @scope("kakao") external make: params => t = "Postcode"

type openParams = {
  q?: string,
  left?: float,
  top?: float,
  popupName?: string,
  autoClose?: bool,
}

@send external openPostCode: (t, openParams) => unit = "open"

type embedParams = {
  q?: string,
  autoClose?: bool,
}

@send external embedPostCode: (t, Dom.element, embedParams) => unit = "embed"
