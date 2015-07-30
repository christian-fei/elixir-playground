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


