basic types..

there are a few helper functions to handle types:

```
is_atom/1         is_binary/1       is_bitstring/1    is_boolean/1
is_float/1        is_function/1     is_function/2     is_integer/1
is_list/1         is_map/1          is_nil/1          is_number/1
is_pid/1          is_port/1         is_reference/1    is_tuple/1
```


# atoms

In other languages they are called Symbols. They are just a placeholder/constant with the value as their name.
The value of an atom is, well, the atom itself.


# anon functions

they are delimited by the keywords `fn` and `end`:

```
mx = fn a, b -> a * b end

mx.(2, 3)
  -> 6

is_function mx
  -> true
```

Note that anonymous functions are invoked with `.` before the paren

Functions are first class citizens in Elixir (`is_function mx`)

Anonymous functions are closures, so they can hold variables inside their scope.


# Linked lists

A list of values (of any type) in Elixir is defined by enclosing square brackets, and values separated by comma. `[1,2,3,true]`

You can concatenated and subtract lists with `++` and `--` operator.

You can retrieve the head and the tail of the list with `hd` and `tl`.

Note that char lists (`'hello'`) and strings (`"hello"`) are different types.


# Tuples

Tuples are defined by enclosing curly braces, and they can hold any value, like lists.

`{:ok, "Hello"}`

There is a helper called `tuple_size`.

Tuples are stored in memory, so accessing at a tuples index or getting its size is a fast operation.

Btw, you can access a tuple at a specific index with `elem`:

```
tuple = {:ok, "Hello"}

elem tuple, 1
  -> "Hello"
```

You can also change the value of a tuple at a specific index with `put_elem` (it does not modify the original structure, rather returns a new one).

This leads us to the conclusion that data types in Elixir are immutable, which means that your effectively cannot modify state, without creating a copy of it.


# Lists or tuples?

Lists are stored as linked lists in memory, so counting and appending is a linear operation on the data structure.

Tuples are stored as a whole in memory, so access is fast but modification requires a copy in memory.

These characteristics determine their use in Elixir/Erlang code. A common use case for tuples is to return extra information from a function.


