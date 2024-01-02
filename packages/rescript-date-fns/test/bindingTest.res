Js.log(Js.Date.make()->DateFns.formatISO)

let date = Js.Date.makeWithYMD(~year=2020., ~month=1., ~date=1., ())

date
->DateFns.formatOpt(
  "yyyy년 M월 d일 (E)",
  {
    locale: DateFns.Locale.ko,
  },
)
->Js.log
