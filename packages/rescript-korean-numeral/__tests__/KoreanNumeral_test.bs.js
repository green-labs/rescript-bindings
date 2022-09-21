// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var Caml_format = require("rescript/lib/js/caml_format.js");
var KoreanNumeral = require("../src/KoreanNumeral.bs.js");

Jest.describe("1만 이하 표시", (function (param) {
        Jest.test("KoreanNumeral.fromInt", (function (param) {
                var result = KoreanNumeral.fromInt(1234, undefined, undefined);
                return Jest.Expect.toBe("1,234", Jest.Expect.expect(result));
              }));
        Jest.test("KoreanNumeral.fromFloat", (function (param) {
                var result = KoreanNumeral.fromFloat(152212525110.0, undefined, undefined);
                return Jest.Expect.toBe("1,522억 1,252만 5,110", Jest.Expect.expect(result));
              }));
        Jest.test("KoreanNumeral.fromInt64", (function (param) {
                var result = KoreanNumeral.fromInt64(Caml_format.int64_of_string("1234567890987654321"), undefined, undefined);
                return Jest.Expect.toBe("123경 4,567조 8,909억 8,765만 4,321", Jest.Expect.expect(result));
              }));
      }));

Jest.describe("1만 이하는 절삭", (function (param) {
        Jest.test("1234 => \"\"", (function (param) {
                var result = KoreanNumeral.fromInt(1234, 1, undefined);
                return Jest.Expect.toBe("", Jest.Expect.expect(result));
              }));
        Jest.test("1234567 => \"123만\"", (function (param) {
                var result = KoreanNumeral.fromInt(1234567, 1, undefined);
                return Jest.Expect.toBe("123만", Jest.Expect.expect(result));
              }));
        Jest.test("1234567890 => \"12억 3,456만\"", (function (param) {
                var result = KoreanNumeral.fromInt(1234567890, 1, undefined);
                return Jest.Expect.toBe("12억 3,456만", Jest.Expect.expect(result));
              }));
        Jest.test("1234567890.1 => \"12억 3,456만\"", (function (param) {
                var result = KoreanNumeral.fromFloat(1234567890.1, 1, undefined);
                return Jest.Expect.toBe("12억 3,456만", Jest.Expect.expect(result));
              }));
        Jest.test("152212525110 => \"1,522억 1,252만\"", (function (param) {
                var result = KoreanNumeral.fromFloat(152212525110.0, 1, undefined);
                return Jest.Expect.toBe("1,522억 1,252만", Jest.Expect.expect(result));
              }));
        Jest.test("152212525110 => \"1,522억\"", (function (param) {
                var result = KoreanNumeral.fromFloat(152200005110.0, 1, undefined);
                return Jest.Expect.toBe("1,522억", Jest.Expect.expect(result));
              }));
        Jest.test("220000152212525110.0 => \"22경 1,522억 1,252만\"", (function (param) {
                var result = KoreanNumeral.fromFloat(220000152212525110.0, 1, undefined);
                return Jest.Expect.toBe("22경 1,522억 1,252만", Jest.Expect.expect(result));
              }));
        Jest.test("1234567890987654321 => \"123경 4,567조 8,909억 8,765만\"", (function (param) {
                var result = KoreanNumeral.fromString("1234567890987654321", 1, undefined);
                return Jest.Expect.toBe("123경 4,567조 8,909억 8,765만", Jest.Expect.expect(result));
              }));
      }));

/*  Not a pure module */
