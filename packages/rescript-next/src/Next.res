module Req = {
  type t

  @get
  external cookies: t => Js.Dict.t<string> = "cookies"

  @get external method: t => string = "method"
  @get external url: t => string = "url"
  @get external port: t => int = "port"
  @get external headers: t => Js.Dict.t<string> = "headers"
  @get
  external rawHeaders: t => array<string> = "rawHeaders"
  @get
  external rawTrailers: t => array<string> = "rawTrailers"
  @get external aborted: t => bool = "aborted"
  @get external complete: t => bool = "complete"
  @send external destroy: t => unit = "destroy"
  @send
  external destroyWithError: (t, Js.Exn.t) => bool = "destroy"
  @get external statusCode: t => int = "statusCode"
  @get
  external statusMessage: t => string = "statusMessage"
  @get
  external trailers: t => Js.Dict.t<string> = "trailers"
}

module Res = {
  type t

  @get external statusCode: t => int = "statusCode"
  @set
  external setStatusCode: (t, int) => unit = "statusCode"
  @send external end: t => unit = "end"
  @send
  external getHeader: (t, string) => option<string> = "getHeader"
  @send
  external setHeader: (t, string, string) => unit = "setHeader"
}

module GetServerSideProps = {
  type result<'a> =
    | Props('a)
    | NotFound
    | Redirect(string)
    | RedirectPermanent(string)
    | RedirectStatusCode(string, int)

  type context<'params> = {
    req: Req.t,
    res: Res.t,
    params: 'params,
    query: Js.Dict.t<string>,
    resolvedUrl: string,
    locale: string,
    locales: array<string>,
    defaultLocale: string,
  }

  type t<'a, 'b> = context<'b> => Js.Promise.t<result<'a>>

  let parseResult = result =>
    switch result {
    | Props(result) => {"props": result}->Obj.magic
    | NotFound => {"notFound": true}->Obj.magic
    | Redirect(url) => {"redirect": {"destination": url, "permanent": false}}->Obj.magic
    | RedirectPermanent(url) => {"redirect": {"destination": url, "permanent": true}}->Obj.magic
    | RedirectStatusCode(url, statusCode) =>
      {
        "redirect": {"destination": url, "statusCode": statusCode},
      }->Obj.magic
    }

  let make = (callback: t<'a, 'b>, context: context<'b>) => {
    callback(context) |> Js.Promise.then_(result => result->parseResult->Js.Promise.resolve)
  }
}

module GetStaticProps = {
  // See: https://github.com/zeit/next.js/blob/canary/packages/next/types/index.d.ts
  type context<'props, 'params, 'previewData> = {
    params: 'params,
    preview: option<bool>, // preview is true if the page is in the preview mode and undefined otherwise.
    previewData: Js.Nullable.t<'previewData>,
  }

  // The definition of a getStaticProps function
  type t<'props, 'params, 'previewData> = context<'props, 'params, 'previewData> => Js.Promise.t<{
    "props": 'props,
  }>
}

module GetStaticPaths = {
  // 'params: dynamic route params used in dynamic routing paths
  // Example: pages/[id].js would result in a 'params = { id: string }
  type path<'params> = {params: 'params}

  type return<'params> = {
    paths: array<path<'params>>,
    fallback: bool,
  }

  // The definition of a getStaticPaths function
  type t<'params> = unit => Js.Promise.t<return<'params>>
}

module Link = {
  @module("next/link") @react.component
  external make: (
    ~href: string,
    @as("as") ~_as: string=?,
    ~prefetch: bool=?,
    ~scroll: bool=?,
    ~replace: option<bool>=?,
    ~shallow: option<bool>=?,
    ~passHref: option<bool>=?,
    ~children: React.element,
  ) => React.element = "default"
}

module Router = {
  /*
      Make sure to only register events via a useEffect hook!
 */
  module Events = {
    type t

    @send
    external on: (
      t,
      @string
      [
        | #routeChangeStart(string => unit)
        | #routeChangeComplete(string => unit)
        | #hashChangeComplete(string => unit)
      ],
    ) => unit = "on"

    @send
    external off: (
      t,
      @string
      [
        | #routeChangeStart(string => unit)
        | #routeChangeComplete(string => unit)
        | #hashChangeComplete(string => unit)
      ],
    ) => unit = "off"
  }

  type router = {
    route: string,
    asPath: string,
    events: Events.t,
    pathname: string,
    query: Js.Dict.t<string>,
  }

  type pathObj = {
    pathname: string,
    query: Js.Dict.t<string>,
  }

  @deriving(abstract)
  type options = {
    @optional
    scroll: bool,
    @optional
    prefetch: bool,
    @optional
    shallow: bool,
  }

  type state = {
    url: string,
    @as("as") _as: string,
    options: options,
  }

  @send external push: (router, string) => unit = "push"
  @send external pushObj: (router, pathObj) => unit = "push"
  @send external pushWithAs: (router, string, option<string>, ~options: options=?) => unit = "push"

  @module("next/router") external useRouter: unit => router = "useRouter"

  @send external replace: (router, string) => unit = "replace"
  @send external replaceObj: (router, pathObj) => unit = "replace"
  @send
  external replaceWithAs: (router, string, option<string>, ~options: options=?) => unit = "replace"

  @scope("options") @set external setScrollOption: (state, bool) => unit = "scroll"

  @send
  external beforePopState: (router, state => bool) => unit = "beforePopState"
}

module Head = {
  @module("next/head") @react.component
  external make: (~children: React.element) => React.element = "default"
}

module Error = {
  @module("next/error") @react.component
  external make: (~statusCode: int, ~children: React.element) => React.element = "default"
}

module Dynamic = {
  @deriving(abstract)
  type options = {
    @optional
    ssr: bool,
    @optional
    loading: unit => React.element,
  }

  @module("next/dynamic")
  external dynamic: (unit => Js.Promise.t<'a>, options) => 'a = "default"

  @val external import_: string => Js.Promise.t<'a> = "import"
}

module Image = {
  type loadedImageSize = {
    naturalWidth: int,
    naturalHeight: int,
  }
  type imageLayout = [#intrinsic | #fixed | #responsive | #fill | #raw]
  @module("next/image") @react.component
  external make: (
    ~className: string=?,
    ~src: string,
    ~alt: string=?,
    ~width: int=?,
    ~height: int=?,
    ~quality: int=?,
    ~priority: bool=?,
    ~layout: imageLayout=?,
    ~onLoadingComplete: loadedImageSize => unit=?,
    ~ref: ReactDOM.domRef=?,
  ) => React.element = "default"
}

module Api = {
  type req

  type method = [#GET | #POST | #PUT | #DELETE | #PATCH]
  
  @get external method: req => method = "method"
  @get external headers: req => 'a = "headers"
  @get external query: req => 'a = "query"
  @get external params: req => 'a = "params"
  @get external cookies: req => 'a = "cookies"
  @get external body: req => 'a = "body"
  @get external env: req => 'a = "env"
  
  type res<'a>

  @send external json: (res<'a>, Js.Json.t) => unit = "json"
  @send external send: (res<'a>, 'a) => unit = "send"
  @send external status: (res<'a>, int) => res<'a> = "status"
  @send external redirect: (res<'a>, string) => res<'a> = "redirect"
  @send external redirectWithStatus: (res<'a>, int, string) => res<'a> = "redirect"
  @send external revalidate: (res<'a>, string) => res<'a> = "revalidate"
  @send external setHeader: (res<'a>, string, string) => res<'a> = "setHeader"
}