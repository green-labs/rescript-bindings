// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Int64 = require("bs-platform/lib/js/int64.js");
var Belt_List = require("bs-platform/lib/js/belt_List.js");
var Caml_int64 = require("bs-platform/lib/js/caml_int64.js");
var Belt_Option = require("bs-platform/lib/js/belt_Option.js");
var Caml_format = require("bs-platform/lib/js/caml_format.js");

var unitsInKorean = {
  hd: "",
  tl: {
    hd: "만",
    tl: {
      hd: "억",
      tl: {
        hd: "조",
        tl: {
          hd: "경",
          tl: /* [] */0
        }
      }
    }
  }
};

var mann = Caml_int64.mk(10000, 0);

function split(divided) {
  if (Int64.equal(divided, Int64.zero)) {
    return /* [] */0;
  } else {
    return {
            hd: Caml_int64.mod_(divided, mann),
            tl: split(Caml_int64.div(divided, mann))
          };
  }
}

function fromInt64(num, dropOpt, param) {
  var drop = dropOpt !== undefined ? dropOpt : 0;
  return Belt_List.toArray(Belt_List.reverse(Belt_List.keep(Belt_Option.getWithDefault(Belt_List.drop(Belt_List.zipBy(split(num), unitsInKorean, (function (num, unit) {
                                      if (Int64.equal(num, Int64.zero)) {
                                        return "";
                                      } else {
                                        return Caml_int64.to_int32(num).toLocaleString("ko-KR") + unit;
                                      }
                                    })), drop), /* [] */0), (function (i) {
                          return i !== "";
                        })))).join(" ");
}

function fromInt(num, dropOpt, param) {
  var drop = dropOpt !== undefined ? dropOpt : 0;
  return fromInt64(Caml_int64.of_int32(num), drop, undefined);
}

function fromFloat(num, dropOpt, param) {
  var drop = dropOpt !== undefined ? dropOpt : 0;
  return fromInt64(Caml_int64.of_float(Math.ceil(num)), drop, undefined);
}

function fromString(num, dropOpt, param) {
  var drop = dropOpt !== undefined ? dropOpt : 0;
  return fromInt64(Caml_format.caml_int64_of_string(num), drop, undefined);
}

exports.unitsInKorean = unitsInKorean;
exports.mann = mann;
exports.split = split;
exports.fromInt64 = fromInt64;
exports.fromInt = fromInt;
exports.fromFloat = fromFloat;
exports.fromString = fromString;
/* No side effect */
