type t
type addressType = [#R | #J] // #R 도로명 | #J 지번
type selected = [#Y | #N] // 선택 상태
type lang = [#K | #E] // #K 한글주소 | #E 영문주소

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
type oncloseResponse = [#FORCE_CLOSE | #COMPLETE_CLOSE]
type onsearchResponse = {q: string, count: int}

type option
@obj
external makeOption: (
  ~oncomplete: oncompleteResponse => unit=?,
  ~onresize: onresizeResponse => unit=?,
  ~onclose: oncloseResponse => unit=?,
  ~onsearch: onsearchResponse => unit=?,
  ~width: float=?,
  ~height: float=?,
  ~animation: bool=?,
  ~focusInput: bool=?,
  ~autoMapping: bool=?,
  ~shorthand: bool=?,
  ~pleaseReadGuide: int=?,
  ~pleaseReadGuideTimer: float=?,
  ~maxSuggestItems: int=?,
  ~showMoreHName: bool=?,
  ~hideMapBtn: bool=?,
  ~hideEngBtn: bool=?,
  ~alwaysShowEngAddr: bool=?,
  ~useBannerLink: bool=?,
  ~theme: {..}=?,
  ~submitMode: bool=?,
  unit,
) => option = ""

@new @scope("daum") external make: option => t = "Postcode"

type openOption
@obj
external makeOpenOption: (
  ~q: string=?,
  ~left: float=?,
  ~top: float=?,
  ~popupName: string=?,
  ~autoClose: bool=?,
  unit,
) => openOption = ""

@send external openPostCode: (t, openOption) => unit = "open"

type embedOption
@obj
external makeEmbedOption: (~q: string=?, ~autoClose: bool=?) => embedOption = ""

@send external embedPostCode: (t, Dom.element, embedOption) => unit = "embed"
