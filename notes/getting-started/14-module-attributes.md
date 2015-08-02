what are they useful for?

- they are used to, well, annotate information for the user or the VM
- they work as constants
- they work as temporary module storage to be used during compilation

## as annotations

```
module MyServer do
  @vsn 2
end
```

in this case the module is annotated with an explicit version number, used in the VM for hot code reloading.

reserved attributes are:

- @moduledoc
- @doc
- @behaviour
- @before_compile

You can write documentation with @moduledoc and @doc. Simply use triple strings for multiline comments/documentations:


```
defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Math.sum(1, 2)
      3

  """

  @doc """
  Calculates the sum of two numbers.
  """
  def sum(a, b), do: a + b
end
```


## as constants

```
defmodule X do
  @something 13
end
```

Their value is read at compile time.


## as temporary storage

i didn't get it.
