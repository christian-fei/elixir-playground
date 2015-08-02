as usual, we have

generators, filters, and collectors

```
for n <- [1,2,3,4], do: n*n

is_odd = fn x -> rem(x,2) == 1 end

for n <- [1,2,3,4], is_odd.(n), do: n * n
```



