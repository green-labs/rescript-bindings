

import * as Curry from "rescript/lib/es6/curry.js";
import * as Js_promise from "rescript/lib/es6/js_promise.js";

var Req = {};

var Res = {};

function parseResult(result) {
  if (typeof result === "number") {
    return {
            notFound: true
          };
  }
  switch (result.TAG | 0) {
    case /* Props */0 :
        return {
                props: result._0
              };
    case /* Redirect */1 :
        return {
                redirect: {
                  destination: result._0,
                  permanent: false
                }
              };
    case /* RedirectPermanent */2 :
        return {
                redirect: {
                  destination: result._0,
                  permanent: true
                }
              };
    case /* RedirectStatusCode */3 :
        return {
                redirect: {
                  destination: result._0,
                  statusCode: result._1
                }
              };
    
  }
}

function make(callback, context) {
  return Js_promise.then_((function (result) {
                return Promise.resolve(parseResult(result));
              }), Curry._1(callback, context));
}

var GetServerSideProps = {
  parseResult: parseResult,
  make: make
};

var GetStaticProps = {};

var GetStaticPaths = {};

var Link = {};

var Events = {};

var Router = {
  Events: Events
};

var Head = {};

var $$Error = {};

var Dynamic = {};

var $$Image = {};

export {
  Req ,
  Res ,
  GetServerSideProps ,
  GetStaticProps ,
  GetStaticPaths ,
  Link ,
  Router ,
  Head ,
  $$Error ,
  Dynamic ,
  $$Image ,
}
/* No side effect */
