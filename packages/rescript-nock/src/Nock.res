type t
type t2

@module("nock") external make: string => t = "default"
@module("nock") external makeRegex: Js.Re.t => t = "default"

// mock network
@module("nock") external disableNetConnect: unit => unit = "disableNetConnect"
@module("nock") external enableNetConnect: unit => unit = "enableNetConnect"

// Http methods
@send external get: (t, string) => t2 = "get"
@send
external getWithRequest: (
  t,
  string,
  @unwrap
  ~request: [
    | #Str(string)
    | #Regex(Js.Re.t)
    | #Json(Js.Json.t)
    | #FnJson(Js.Json.t => bool)
    | #FnAny('a => bool)
    | #Any('a)
  ]=?,
  unit,
) => t2 = "get"
@send external post: (t, string) => t2 = "post"
@send
external postWithRequest: (
  t,
  string,
  @unwrap
  ~request: [
    | #Str(string)
    | #Regex(Js.Re.t)
    | #Json(Js.Json.t)
    | #FnJson(Js.Json.t => bool)
    | #FnAny('a => bool)
    | #Any('a)
  ]=?,
  unit,
) => t2 = "post"
@send external put: (t, string) => t2 = "put"
@send
external putWithRequest: (
  t,
  string,
  @unwrap
  [
    | #Str(string)
    | #Regex(Js.Re.t)
    | #Json(Js.Json.t)
    | #FnJson(Js.Json.t => bool)
    | #FnAny('a => bool)
    | #Any('a)
  ],
) => t2 = "put"
@send external delete: (t, string) => t2 = "delete"
@send
external deleteWithRequest: (
  t,
  string,
  @unwrap
  ~request: [
    | #Str(string)
    | #Regex(Js.Re.t)
    | #Json(Js.Json.t)
    | #FnJson(Js.Json.t => bool)
    | #FnAny('a => bool)
    | #Any('a)
  ]=?,
  unit,
) => t2 = "delete"

// query
@send external query: (t2, string) => t2 = "query"
@send external queryJson: (t2, Js.Json.t) => t2 = "query"
@send external querySearchParams: (t2, Webapi.Url.URLSearchParams.t) => t2 = "query"
@send external queryAny: (t2, 'a) => t2 = "query"

// reply
@send external reply: (t2, int) => t = "reply"
@send external replyText: (t2, int, string) => t = "reply"
@send external replyJson: (t2, int, Js.Json.t) => t = "reply"
@send external replyAny: (t2, int, 'a) => t = "reply"

// done
@send external done: t => unit = "done"
@send external isDone: t => bool = "isDone"
