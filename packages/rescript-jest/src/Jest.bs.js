

import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

var Test = {};

function results(mock) {
  return Belt_Array.map(mock.mock.results, (function (result) {
                var match = result.type;
                if (match === "return") {
                  return {
                          TAG: /* Return */0,
                          _0: result.value
                        };
                } else if (match === "throw") {
                  return {
                          TAG: /* Throw */1,
                          _0: result.value
                        };
                } else {
                  return /* Imcomplete */0;
                }
              }));
}

var Mock = {
  results: results
};

function lastCalledWith(expect, argList) {
  expect.lastCalledWith.apply(null, Array.isArray(argList) ? argList : [argList]);
}

function nthCalledWith(expect, nth, argList) {
  expect.nthCalledWith.apply(null, Belt_Array.concat([nth], Array.isArray(argList) ? argList : [argList]));
}

function toBeCalledWith(expect, argList) {
  expect.toBeCalledWith.apply(null, Array.isArray(argList) ? argList : [argList]);
}

var Expect = {
  lastCalledWith: lastCalledWith,
  nthCalledWith: nthCalledWith,
  toBeCalledWith: toBeCalledWith
};

var JestJs = {};

export {
  Test ,
  Mock ,
  Expect ,
  JestJs ,
}
/* No side effect */
