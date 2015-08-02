## alias

`alias` is useful to create aliases to modules

```
...
  alias Math.List, as: List
...
```

`alias` is lexically scoped.



## require

if we want to use a macro of a module (like `Math.is_odd`) we need to `require` the module.


```
require Integer
Integer.is_odd(3)
```


## import

if we want to use a macro or function without its fully qualified name (maybe because it`s used often), we can
`import` only the function we are interested in:

```
import List, only: [duplicate/2]

duplicate :ok, 3
```

`import` is lexically scope, and automatically `require`s the module.



## Aliases

an alias is a capitalized identifier, which is converted to an atom during compilation.
This is how erlang and elixir code cooperates, since in erlang modules are represented by atoms.

```
:"Elixir.String" == String
is_atom String
  -> true
```



## Nesting

you can nest modules

```
defmodule Foo do
  defmodule Bar do
  end
end
```

is equivalent to:

```
defmodule Foo.Bar do
end

defmodule Foo do
  alias Foo.Bar, as: Bar
end
```

