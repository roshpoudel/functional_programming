## Question 4 - Roshan Poudel (CS326)

1. Saša Jurić uses a tuple of tuples to represent the grid in Conway's Game of Life, which is easy to traverse but inefficient for updating due to immutability. Lists are used for iteration, but tuples are not optimized for frequent changes. This representation leads to excessive memory usage and costly updates.

2. Using a set-based representation improves performance and memory efficiency. Only live cells are stored, making updates faster as only a subset of cells need to be processed rather than the entire grid.

3. Functional abstraction in Jurić's context refers to breaking down operations into composable functions. Unlike object-oriented encapsulation, which hides state and behavior within objects, functional abstraction emphasizes stateless operations where data is transformed without side effects, promoting immutability and composability. Encapsulation bundles data and methods, while functional abstraction focuses on behavior-driven transformations.