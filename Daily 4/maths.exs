# Author: Roshan Poudel
# Assignment: Daily 4
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Sept 15, 2024

defmodule Maths do
    # PART 1 ---------------------
    def average(first, second) do
        (first + second) / 2
    end

    def discrim(a,b,c) do
        b*b - 4*a*c
    end

    def  quad(a,b,c) do
        d = discrim(a,b,c)
        if d < 0 do
            {:error, "No real roots"}
        else
            r1 = (-b + :math.sqrt(d)) / (2*a)
            r2 = (-b - :math.sqrt(d)) / (2*a)
            {:ok, {r1, r2}}
        end
    end

    # PART 2----------------------
    def evaluate(equation, x) do
        # Check if it's a quadratic equation

        if elem(equation, 0) == :quad do
            {_, a, b, c} = equation
            a * x * x + b * x + c   # Evaluate the quadratic equation: ax^2 + bx + c
        else 
            if elem(equation, 0) == :cubic do
                {_, a, b, c, d} = equation
                a * x * x * x + b * x * x + c * x + d   # Evaluate the cubic equation: ax^3 + bx^2 + cx + d
            else
                {:error, "Invalid quadratic equation tuple"}
            end
        end
    end
end


IO.puts "\nPART 1 Tests\n"
IO.puts "Average of 10 and 10 is #{Maths.average(10, 10)}"
IO.puts "Average of 5 and 7 is #{Maths.average(5, 7)}"
IO.puts "Average of 5 and 8 is #{Maths.average(5, 8)}"
IO.puts "Average of 5.0 and 8.0 is #{Maths.average(5.0, 8.0)}"
IO.puts "Average of 12.4 and 13.7 is #{Maths.average(12.4, 13.7)}\n"

IO.puts "Discriminant of 2, 7, 5 is #{Maths.discrim(2, 7, 5)}"
IO.puts "Discriminant of 1, 2, 1 is #{Maths.discrim(1, 2, 1)}"
IO.puts "Discriminant of 1, 2, 3 is #{Maths.discrim(1, 2, 3)}\n"

IO.puts "Quadratic roots of 2, 7, 5 are #{inspect Maths.quad(2, 7, 5)}"
IO.puts "Quadratic roots of 1, 2, 1 are #{inspect Maths.quad(1, 2, 1)}"
IO.puts "Quadratic roots of 1, 2, 3 are #{inspect Maths.quad(1, 2, 3)}\n"

IO.puts "\nPART 2 Tests\n"
IO.puts "Evaluate quadratic equation {:quad, 1, 3, 2} at x = 2: #{inspect Maths.evaluate({:quad, 1, 3, 2}, 2)}"
IO.puts "Evaluate cubic equation {:cubic, 1, 3, 2, 16} at x = 5: #{inspect Maths.evaluate({:cubic, 1, 3, 2, 16}, 5)}"
IO.puts "Evaluate cubic equation {:errortest, 1, 3, 2, 16, 18} at x = 5: #{inspect Maths.evaluate({:errortest, 1, 3, 2, 16, 18}, 5)}\n\n"
