
## PART 01


| Processes | CPU time | Wall-clock time | Max processes |
| :----: | :----: | :----: | :----: |
| 20000 | 1.4 | 1.55 | 1048576 |
| 40000 | 1.225 | 1.45 | 1048576 |
| 100000 | 0.91 | 1.07 | 1048576 |
| 300000 | 0.77 | 0.88 | 1048576 |


## PART 02

```elixir
iex --erl "+P 3000000" processes.ex
```

| Processes | CPU time | Wall-clock time | Max processes |
| :----: | :----: | :----: | :----: |
| 300000 | 0.80 | 1.05 | 4194304 |
| 1000000 | 0.914 | 1.086 | 4194304 |
| 2000000 | 0.994 | 1.2375 | 4194304 |
| 4000000 | 1.04125 | 1.35725 | 4194304 |

```elixir
:observer.start
```

| Number of Logical CPUs | Number of Online Schedulers |
| :----: | :----: |
| 8 | 8 |

After running 1,000,000 processed

| Greatest scheduler utilization | Largest Memory Usage |
| :----: | :----: |
| 65% | 2400 MB |


```elixir
> :math.log2(1048576)
> 20.0 
```

Since log2(max_number_of_processes) is an integer, it is a power of 2

## Part 03

#### erlang:system_info/1:

The erlang:system_info/1 function provides information about the Erlang system, including process limits, memory, version, and more.

**process_limit**:
**Usage**: erlang:system_info(process_limit)
**Description**: Returns the maximum number of processes that the Erlang VM can create. This limit is usually configurable and can be useful to monitor or control for high-concurrency applications.

#### erlang:statistics/1
The erlang:statistics/1 function provides various runtime statistics of the Erlang VM, such as memory usage, reductions, and time metrics.

**runtime**:
**Usage**: erlang:statistics(runtime)
**Description**: Returns the total runtime of the Erlang VM in milliseconds, excluding time when the system is idle.

**wall_clock**:
**Usage**: erlang:statistics(wall_clock)
**Description**: Returns the elapsed wall-clock time (real time) since the Erlang VM started, in milliseconds. This includes idle time and is useful for tracking total uptime.


The :die message in Erlang (and Elixir) is a convention used to gracefully terminate a spawned process. When a process receives :die, it knows to stop its operations, allowing it to clean up or log information before exiting. This provides a controlled and predictable way to end processes without abruptly killing them, enhancing code clarity and stability.


