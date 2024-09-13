defmodule Checkout do 
    def total_cost(price, tax) do
        price * (tax + 1)
    end
end

IO.puts Checkout.total_cost(100, 0.2)