Several functions can be grouped into a module.

To create our own module, we use the `defmodule` macro. To define functions inside that module we use the `def` macro.

## compilation

with `elixirc`

```
elixirc something.ex
```

This will generate a *.beam file containing the bytecode to be run in the VM.

Usually Elixir projects are organized in the following manner:

- an `ebin` directory for the compiled bytecode
- a `lib` directory containing the source files (.ex)
- a `test` directory containing the tests (.exs)

Usually you would use `mix` as the build tool.



## scripting

the difference in extensions `.ex` and `.exs`, is that the latter is used for scripting.
this means the program will be compiled and run completely in memory, it will not generate
any compiled beam files.




## named functions

public functions available for other modules are defined with the macro `def`, private functions with `defp`.

```
module X
  def something do
    something_else
  end

  defp something_else do
    # i do nothin
  end
end
```

we can have guards on our function declarations too with the `when` keyword:

```
...
  def zero? x when is_number x do
    ...
  end
...



## function capturing

as we said, in elixir function can be distinguished with `name/arity`. Meaning a function is different from another by its name and number of parameters.

we can capture (get hold of) a function following this syntax `name/arity`:


```
fun = &Math.abs/1
is_function fun
  -> true

fun.(0)
  -> 0
```

notice the `.`, since it`s an anonymous function.


## default arguments

default are evaluated during the function call, not during compilation.

```
def some(thing \\ " ") do
end
```

