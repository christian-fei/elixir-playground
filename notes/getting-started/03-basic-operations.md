As we have seen before, we can concatenate and subtract lists with the operators `++` and  `--`:

```
[1,2,3] ++ [4,5,6]
  -> [1,2,3,4,5,6]

[1,2,3] -- [1,3]
  -> [2]
```

---

String concatenated is done with the weird operator `<>`:

```
"Hello" <> " " <> "World"
```

---

Elixir also provides three boolean operators: `and`, `or` and `not`.

Notice that providing a non-boolean parameter raises an exception:

```
1 and true
  -> ** (ArgumentError) argument error
```

Elixir provides additionaly boolean operators: `&&`, `||` and `!`:

```
1 || true
  -> 1

false || 11
  -> 11

nil && 13
  -> nil

!nil
  -> true
```



