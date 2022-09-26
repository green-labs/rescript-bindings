# 💞 rescript-bindings

> rescript bindings monorepo

## List

- [@greenlabs/rescript-next](https://www.npmjs.com/package/@greenlabs/rescript-next)
- [@greenlabs/rescript-nock](https://www.npmjs.com/package/@greenlabs/rescript-nock)
- [@greenlabs/rescript-jest](https://www.npmjs.com/package/@greenlabs/rescript-jest)
- [@greenlabs/rescript-react-hook-form](https://www.npmjs.com/package/@greenlabs/rescript-react-hook-form)
- [@greenlabs/rescript-testing-library](https://www.npmjs.com/package/@greenlabs/rescript-testing-library)
- [@greenlabs/rescript-daum-postcode](https://www.npmjs.com/package/@greenlabs/rescript-daum-postcode)
- [@greenlabs/rescript-resct-linkify](https://www.npmjs.com/package/react-linkify)

## Development

**Install dependencies**

```shell
yarn
```

**Run Build**

Must be executed before open PR.

```shell
yarn build
```

**Add new package**

```shell
cd packages
mkdir new-package
yarn init
```

example `package.json`

```json
{
  "name": "@greenlabs/${package-name}",
  "description": "${description}",
  "version": "0.0.0",
  "license": "MIT",
  "author": "Greenlabs Dev <developer@greenlabs.co.kr>",
  "scripts": {
    "start": "rescript build -w",
    "build": "rescript build -with-deps"
  },
  "keywords": ["ReScript"],
  "publishConfig": {
    "access": "public"
  },
  "bugs": "https://github.com/green-labs/rescript-bindings/issues",
  "repository": {
    "type": "git",
    "url": "https://github.com/green-labs/rescript-bindings.git",
    "directory": "packages/${package-name}"
  }
}
```

## Release

- use [changesets](https://github.com/changesets/changesets)

```shell
yarn changeset add
```
