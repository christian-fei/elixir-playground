`case`, `cond` and `if` are basic control flow structures in elixir.

## case

allows to match against multiple patterns/clauses:

```
case cond of
  1 ->
    # do something
  _ ->
    # if none previous matches
end
```

We can also use guards in clauses:

```
case x do
  {1,y,3} when y >= 2 ->
    ..
end


If none of the clauses match, an error is raised.
Additionally, if a clauses fails, the error is restricted to guard and does not leak.

---

Note that anonymous functions can have clauses and guards too (though they must have the same arity):

```
f = fn
  x, y when x > 0 ->
    x + y
  x, y ->
    x * y
end
```



## cond

cond is weird, they say it`s "useful to match against different values", but i don`t yet get it.



## if and unless

`if` and `unless` are macros in the language, and work as you expect, they take a condition and a block.

They can be found in the `Kernel` module.



## do/end blocks

`do` blocks are bound to the outermost function call, meaning that you sometimes would need to put explicit parens around the block.



