in elixir we have two associative data structures (in other langs they are often called dictionaries, maps):

keyword lists and maps.

## keyword lists

keyword lists are just a list of tuples with two values, where the first is an atom.

And they support a special syntactic sugar to make them easier to handle (or better, type):

```
klist = [{:a,"foo"}, {:b, "bar"}]

[a: "foo", b: "bar"] = klist
```

You can access a value by its atom key:

```
a = klist[:a]
```

Since they are just lists, the same characteristics and operations apply to them:

```
klist ++ [c: 3]
```

there is the `Keyword` module:

```
Keyword.

delete/2          delete/3          delete_first/2    drop/2
equal?/2          fetch!/2          fetch/2           get/3
get_values/2      has_key?/2        keys/1            keyword?/1
merge/2           merge/3           new/0             new/1
new/2             pop/3             pop_first/3       put/3
put_new/3         split/2           take/2            update!/3
update/4          values/1
```


## maps

when you need a key-value store, use maps.

they are created with the `%{}` syntax:

```
map = %{:a => 1, :b => 2, 2 => :c}

map[:a]
  -> 1
map[2]
  -> :c
```

interestingly, if all keys of a mpa are atoms, you can use this syntax:

```
map = %{a: 1, b: 2}
```

In contrast to keyword lists, maps are perfact for pattern matching:

```
%{a: a} = %{a: 1, b: 2}

a
  -> 1
```


there is the `Map` module:
```
Map.

delete/2         drop/2           equal?/2         fetch!/2
fetch/2          from_struct/1    get/3            has_key?/2
keys/1           merge/2          merge/3          new/0
pop/3            put/3            put_new/3        size/1
split/2          take/2           to_list/1        update!/3
update/4         values/1
```



## Dicts

Both keyword list and map implement the `Dict` interface. In elixir you the have the same `behaviour`.

