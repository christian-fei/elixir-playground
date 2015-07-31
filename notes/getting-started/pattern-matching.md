In Elixir/Erlang, `=` is the match operator.

We can see why it`s the match operator, rather than the assignment operator:

```
x = 1
  -> 1
x
  -> 1

1 = x
  -> 1
2 = x
  -> ** MatchError
```


## Pattern matching

The match operator is also helpful for destructuring more complex data types.
You can pattern match (destruct) tuples:

```
{a,b,c} = {:hello, "world", 42}
```

and also on lists:

```
[a,b,c] = [1,2,3]

[head | tail] = [1,2,3]
```


## pin operator

it is used to get hold of the previous value of a variable. right now I don`t see the use
