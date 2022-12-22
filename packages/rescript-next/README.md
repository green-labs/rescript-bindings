# `rescript-next`

ReScript binding of [Next.js](https://nextjs.org)

## Install

```bash
npm i @greenlabs/rescript-next
or
yarn add @greenlabs/rescript-next
```

```json
"bs-dependencies": [
  "@greenlabs/rescript-next"
]
```

## Usage

```rescript
<Next.Head>
  <title> {`rescript-next`->React.string} </title>
</Next.Head>
```

```rescript
let default = (req: Next.Api.req, res: Next.Api.res) => {
  res
  ->Next.Api.status(200)
  ->Next.Api.send({
    "message": {
      switch req->Next.Api.query->Js.Dict.get("message") {
      | Some(message) => message
      | None => "Hello ReScript!"
      }
    },
  })
}
```
