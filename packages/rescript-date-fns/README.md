# `rescript-date-fns`

## Getting started

```bash
npm install @greenlabs/rescript-date-fns --save
or
yarn add @greenlabs/rescript-date-fns
```

Add `"@greenlabs/rescript-date-fns"` to `bs-dependencies` in your project's `bsconfig.json`

## Differences from original date-fns API

In bindings the date parameter is moved to last position in a bunch of functions to work better with currying and make better use of pipe operator. Most of these can be seen from types. The ones that have same types but are different from date-fns:

```rs
laterDate |> DateFns.isAfter(earlierDate) /* true */
DateFns.isAfter(earlierDate, laterDate) /* true */

earlierDate |> DateFns.isBefore(laterDate) /* true */
DateFns.isBefore(laterDate, earlierDate) /* true */

middleDate |> DateFns.isWithinRange(earliestDate, latestDate) /* true */
DateFns.isWithinRange(earliestDate, latestDate, middleDate) /* true */
```
