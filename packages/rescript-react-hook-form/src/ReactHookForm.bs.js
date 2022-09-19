

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as ReactHookForm from "react-hook-form";

function sync(syncHandler) {
  return syncHandler;
}

function async(asyncHandler) {
  return asyncHandler;
}

var Validation = {
  sync: sync,
  async: async
};

function empty(param) {
  
}

function make(config) {
  return config;
}

function makeWithErrorMessage(config) {
  return config;
}

function merge(a, b) {
  return Object.assign(Object.assign({}, a), b);
}

var Rules = {
  empty: empty,
  make: make,
  makeWithErrorMessage: makeWithErrorMessage,
  merge: merge
};

var Register = {};

var UnRegister = {};

var $$Error = {};

function Make(funarg) {
  var createResolverFromResult = function (resolver, data) {
    var data$p = Curry._1(resolver, data);
    if (data$p.TAG === /* Ok */0) {
      return {
              values: data$p._0,
              errors: {}
            };
    } else {
      return {
              values: data,
              errors: data$p._0
            };
    }
  };
  var Context = {};
  var ReactHookForm$Make$Provider$SpreadProps = function (Props) {
    return React.cloneElement(Props.children, Props.props);
  };
  var ReactHookForm$Make$Provider = function (Props) {
    var children = Props.children;
    var methods = Props.methods;
    return React.createElement(ReactHookForm$Make$Provider$SpreadProps, {
                children: React.createElement(ReactHookForm.FormProvider, {
                      children: children
                    }),
                props: methods
              });
  };
  return {
          createResolverFromResult: createResolverFromResult,
          MakeInput: (function (funarg) {
              var makeRule = function (config) {
                return config;
              };
              var makeRuleWithErrorMEssage = function (config) {
                return config;
              };
              var useWatch = function (form) {
                return ReactHookForm.useWatch({
                            control: form.control,
                            name: funarg.name
                          });
              };
              var watch = function (form) {
                return form.watch(funarg.name);
              };
              var getValue = function (form) {
                return form.getValues(funarg.name);
              };
              var setValue = function (form, value) {
                form.setValue(funarg.name, value, undefined);
              };
              var setValueWithOption = function (form, value, shouldValidate, shouldDirty, shouldTouch) {
                var partial_arg = {
                  shouldValidate: shouldValidate,
                  shouldDirty: shouldDirty,
                  shouldTouch: shouldTouch
                };
                return function (param) {
                  form.setValue(funarg.name, value, partial_arg !== undefined ? Caml_option.valFromOption(partial_arg) : undefined);
                };
              };
              var resetField = function (form) {
                form.resetField(funarg.name);
              };
              var setError = function (form, error) {
                form.setError(funarg.name, error);
              };
              var setErrorShouldFocus = function (form, error) {
                form.setError(funarg.name, error, { shouldFocus: true });
              };
              var createError = function (type_, message) {
                return [
                        funarg.name,
                        {
                          message: message,
                          type: type_
                        }
                      ];
              };
              var focus = function (form) {
                form.setFocus(funarg.name);
              };
              var focusShouldSelect = function (form) {
                form.setFocus(funarg.name, { shouldSelect: true });
              };
              var getFieldState = function (form) {
                return form.getFieldState(funarg.name, form.formState);
              };
              var error = function (form) {
                return getFieldState(form).error;
              };
              var isDirty = function (form) {
                return getFieldState(form).isDirty;
              };
              var isTouched = function (form) {
                return getFieldState(form).isTouched;
              };
              var invalid = function (form) {
                return getFieldState(form).invalid;
              };
              var clearError = function (form) {
                form.clearErrors(funarg.name);
              };
              var trigger = function (form) {
                return form.trigger(funarg.name);
              };
              var unregister = function (form, config) {
                form.unregister(funarg.name, config);
              };
              var Controller = {};
              var renderController = function (form, render, defaultValue, rules, shouldUnregister, param) {
                var tmp = {
                  name: funarg.name,
                  control: form.control,
                  render: render,
                  rules: merge(funarg.config, rules)
                };
                if (defaultValue !== undefined) {
                  tmp.defaultValue = Caml_option.valFromOption(defaultValue);
                }
                if (shouldUnregister !== undefined) {
                  tmp.shouldUnregister = shouldUnregister;
                }
                return React.createElement(ReactHookForm.Controller, tmp);
              };
              var useController = function (form, rules, shouldUnregister, param) {
                return ReactHookForm.useController({
                            name: funarg.name,
                            control: form.control,
                            rules: rules,
                            shouldUnregister: shouldUnregister
                          });
              };
              var triggerWithFocus = function (form) {
                return form.trigger(funarg.name, {shouldFocus: true});
              };
              var register = function (form, config, param) {
                return form.register(funarg.name, Caml_option.some(merge(funarg.config, config)));
              };
              var renderWithRegister = function (form, element, config, param) {
                return React.cloneElement(element, register(form, Caml_option.some(config), undefined));
              };
              return {
                      makeRule: makeRule,
                      makeRuleWithErrorMEssage: makeRuleWithErrorMEssage,
                      useWatch: useWatch,
                      watch: watch,
                      getValue: getValue,
                      setValue: setValue,
                      setValueWithOption: setValueWithOption,
                      resetField: resetField,
                      setError: setError,
                      setErrorShouldFocus: setErrorShouldFocus,
                      createError: createError,
                      focus: focus,
                      focusShouldSelect: focusShouldSelect,
                      getFieldState: getFieldState,
                      error: error,
                      isDirty: isDirty,
                      isTouched: isTouched,
                      invalid: invalid,
                      clearError: clearError,
                      trigger: trigger,
                      unregister: unregister,
                      renderController: renderController,
                      useController: useController,
                      triggerWithFocus: triggerWithFocus,
                      register: register,
                      renderWithRegister: renderWithRegister
                    };
            }),
          MakeInputArray: (function (funarg) {
              var T = funarg;
              var makeRule = function (config) {
                return config;
              };
              var makeRuleWithErrorMEssage = function (config) {
                return config;
              };
              var useWatch = function (form) {
                return ReactHookForm.useWatch({
                            control: form.control,
                            name: T.name
                          });
              };
              var watch = function (form) {
                return form.watch(T.name);
              };
              var getValue = function (form) {
                return form.getValues(T.name);
              };
              var setValue = function (form, value) {
                form.setValue(T.name, value, undefined);
              };
              var setValueWithOption = function (form, value, shouldValidate, shouldDirty, shouldTouch) {
                var partial_arg = {
                  shouldValidate: shouldValidate,
                  shouldDirty: shouldDirty,
                  shouldTouch: shouldTouch
                };
                return function (param) {
                  form.setValue(T.name, value, partial_arg !== undefined ? Caml_option.valFromOption(partial_arg) : undefined);
                };
              };
              var resetField = function (form) {
                form.resetField(T.name);
              };
              var setError = function (form, error) {
                form.setError(T.name, error);
              };
              var setErrorShouldFocus = function (form, error) {
                form.setError(T.name, error, { shouldFocus: true });
              };
              var createError = function (type_, message) {
                return [
                        T.name,
                        {
                          message: message,
                          type: type_
                        }
                      ];
              };
              var focus = function (form) {
                form.setFocus(T.name);
              };
              var focusShouldSelect = function (form) {
                form.setFocus(T.name, { shouldSelect: true });
              };
              var getFieldState = function (form) {
                return form.getFieldState(T.name, form.formState);
              };
              var error = function (form) {
                return getFieldState(form).error;
              };
              var isDirty = function (form) {
                return getFieldState(form).isDirty;
              };
              var isTouched = function (form) {
                return getFieldState(form).isTouched;
              };
              var invalid = function (form) {
                return getFieldState(form).invalid;
              };
              var clearError = function (form) {
                form.clearErrors(T.name);
              };
              var trigger = function (form) {
                return form.trigger(T.name);
              };
              var unregister = function (form, config) {
                form.unregister(T.name, config);
              };
              var Controller = {};
              var renderController = function (form, render, defaultValue, rules, shouldUnregister, param) {
                var tmp = {
                  name: T.name,
                  control: form.control,
                  render: render,
                  rules: merge(T.config, rules)
                };
                if (defaultValue !== undefined) {
                  tmp.defaultValue = Caml_option.valFromOption(defaultValue);
                }
                if (shouldUnregister !== undefined) {
                  tmp.shouldUnregister = shouldUnregister;
                }
                return React.createElement(ReactHookForm.Controller, tmp);
              };
              var useController = function (form, rules, shouldUnregister, param) {
                return ReactHookForm.useController({
                            name: T.name,
                            control: form.control,
                            rules: rules,
                            shouldUnregister: shouldUnregister
                          });
              };
              var triggerWithFocus = function (form) {
                return form.trigger(T.name, {shouldFocus: true});
              };
              var register = function (form, config, param) {
                return form.register(T.name, Caml_option.some(merge(T.config, config)));
              };
              var renderWithRegister = function (form, element, config, param) {
                return React.cloneElement(element, register(form, Caml_option.some(config), undefined));
              };
              var useFieldArray = function (form, config, param) {
                return ReactHookForm.useFieldArray({
                            control: form.control,
                            name: funarg.name
                          }, Caml_option.some(merge(funarg.config, config)));
              };
              var registerWithIndex = function (form, index, config, propertyOpt, param) {
                var property = propertyOpt !== undefined ? propertyOpt : "";
                return form.register("" + funarg.name + "." + String(index) + "" + (
                            property !== "" ? "." + property + "" : ""
                          ) + "", Caml_option.some(merge(funarg.config, config)));
              };
              var renderWithIndexRegister = function (form, index, element, propertyOpt, config, param) {
                var property = propertyOpt !== undefined ? propertyOpt : "";
                return React.cloneElement(element, registerWithIndex(form, index, Caml_option.some(config), property, undefined));
              };
              return {
                      makeRule: makeRule,
                      makeRuleWithErrorMEssage: makeRuleWithErrorMEssage,
                      useWatch: useWatch,
                      watch: watch,
                      getValue: getValue,
                      setValue: setValue,
                      setValueWithOption: setValueWithOption,
                      resetField: resetField,
                      setError: setError,
                      setErrorShouldFocus: setErrorShouldFocus,
                      createError: createError,
                      focus: focus,
                      focusShouldSelect: focusShouldSelect,
                      getFieldState: getFieldState,
                      error: error,
                      isDirty: isDirty,
                      isTouched: isTouched,
                      invalid: invalid,
                      clearError: clearError,
                      trigger: trigger,
                      unregister: unregister,
                      renderController: renderController,
                      useController: useController,
                      triggerWithFocus: triggerWithFocus,
                      register: register,
                      renderWithRegister: renderWithRegister,
                      useFieldArray: useFieldArray,
                      registerWithIndex: registerWithIndex,
                      renderWithIndexRegister: renderWithIndexRegister
                    };
            }),
          Context: Context,
          Provider: {
            make: ReactHookForm$Make$Provider
          }
        };
}

export {
  Validation ,
  Rules ,
  Register ,
  UnRegister ,
  $$Error ,
  Make ,
}
/* react Not a pure module */
