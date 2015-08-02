## Loops through recursion

due to immutability of state, loops in functional languages are achieved by recursion.
The "loop" stops with case in which the recursion stops.


## Reduce and map algorithms

to sum a list of number you could use a recursive function that keeps track of the accumulated sum:

```
def sum_numbers numbers do
  sum_numbers numbers, 0
end

defp sum_numbers numbers, accumulator when numbers == [] do
  accumulator
end

defp sum_numbers numbers, accumulator do 
  [number | rest] = numbers
  sum_numbers rest, accumulator + number
end
```

this techique is also called tail recursion.

The `Enum` module has lots of utility functions to work with lists:

```
Enum.reduce([1,2,3], 0, fn x, acc -> x + acc end)
# or with the capture syntax

Enum.reduce([1,2,3], 0, &+/2)
```
