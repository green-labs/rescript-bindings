# `rescript-react-linkify`

## Install

```bash
npm i @greenlabs/rescript-react-linkify
or
yarn add @greenlabs/rescript-react-linkify
```

```json
"bs-dependencies": [
  "@greenlabs/rescript-react-linkify"
]
```

## Usage

```rescript
@react.component
let make = () => {
<Linkify
  componentDecorator={(decoratedHref, decoratedText, index) => {
    <a
      target="_blank"
      key={decoratedHref ++ decoratedText ++ Int.toString(index)}
      href={decoratedHref}>
      {decoratedText->React.string}
    </a>
  }}>
  {"Contents"->React.string}
</Linkify>
}
```
