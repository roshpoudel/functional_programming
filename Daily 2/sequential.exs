#---
# 
# Sequential - Elixir version of Joe Armstrong's first 5 "Erlang in 11 Minutes"
# 
#---

defmodule In11Minutes.Sequential do

  def fac(n) when n > 0 do 
    n * fac(n-1)
  end
  def fac(0), do: 1

  def append([], ls),    do: ls
  def append([h|t], ls), do: [h | append(t, ls)]

  def member(_, []),    do: false
  def member(h, [h|_]), do: true
  def member(h, [_|t]), do: member(h, t)

  def lookup(key, {key, val, _, _}) do
    {:ok, val}
  end
  def lookup(key, {key1, val, left, right}) when key < key1 do
    lookup(key, left)
  end
  def lookup(key, {key1, val, left, right}) do
    lookup(key, right)
  end
  def lookup(key, nil), do: :notfound

  def sort([]),       do: []
  def sort([pivot|t]) do
    sort(for x <- t, x < pivot, do: x)  ++ [pivot] ++ sort(for x <- t, x >= pivot, do: x)
  end

end

# Output the Elixir way, using a variable
r = In11Minutes.Sequential.fac(0)
IO.puts "fac 0 is #{r}"

# Output the Elixir way, no variable
IO.puts "fac 10 is #{In11Minutes.Sequential.fac(10)}"

# the Erlang way using format
:io.format("fac 0 is ~b~n", [In11Minutes.Sequential.fac(0)])

tree = {"Fido", :shitzu, {"Biff", :goldenretriever, nil, {"Doogie", :sharpei, nil, nil}}, {"Ralph", :pug, {"Lassie", :collie, nil, nil}, {"Tralfaz", :rottie, nil, nil}}}

r = In11Minutes.Sequential.lookup("RinTinTin", tree)
IO.puts "RinTinTin in tree? #{r}"

{:ok, r} = In11Minutes.Sequential.lookup("Ralph", tree)
IO.puts "Ralph in tree? #{r}"

{:ok, r} = In11Minutes.Sequential.lookup("Doogie", tree)
IO.puts "Doogie in tree? #{r}"

lst = [5, 10, -4, 18, 7, 33, 101, 20]

IO.inspect lst

:io.format("Append ~p to ~p: ~p~n", [[1, 2, 3, 4], lst, In11Minutes.Sequential.append([1, 2, 3, 4], lst)])
:io.format("Member? ~p in ~p? ~p~n", [7, lst, In11Minutes.Sequential.member(7, lst)])
:io.format("Member? ~p in ~p? ~p~n", [11, lst, In11Minutes.Sequential.member(11, lst)])
:io.format("Original: ~p~nSorted: ~p~n", [lst, In11Minutes.Sequential.sort(lst)])