@module("react-linkify") @react.component
external make: (
  ~componentDecorator: (string, string, int) => React.element,
  ~children: React.element,
) => React.element = "default"
