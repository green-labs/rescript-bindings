

import * as Caml_option from "rescript/lib/es6/caml_option.js";
import Format from "date-fns/format";
import FormatISO from "date-fns/formatISO";
import Ko from "date-fns/locale/ko";

console.log(FormatISO(new Date()));

var date = new Date(2020, 1, 1);

console.log(Format(date, "yyyy년 M월 d일 (E)", {
          locale: Caml_option.some(Ko)
        }));

export {
  date ,
}
/*  Not a pure module */
