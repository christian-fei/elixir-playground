## types and specs

Elixir is dynamically typed, and all types are inferred at runtime. Elixir comes
with `typespecs` which are used for 
- declaring custom data types
- declared typed functions

### function specifications

you can define a spec with the annotation `@spec` followed by the type signature (return value) of the function:

```
@spec round(number) :: integer
def round(number) do
  ...
end
```

### defining custom types

you can define custom types with `@type` and document it with `@typedoc`:

```
@typedoc """

"""
@type temperature_with_unit :: {number, String.t}

@spec def temp :: temperature_with_unit
...
```

### static analysis

with a tool called `Dializer` you can run static analysis or your annotated code



## Behaviours

Behaviours are like interfaces in other langs, they define a set of functions to be implemented to be compatible with the interface.

### defining behaviours

with `defcallback` you define the set of functions to be implemented.

```
defmodule Parser do
  use Behaviour

  defcallback parse(String.t) :: any
end
```


### adopting behaviours

with the  `@behaviour` annotation you can implement a behaviour.


