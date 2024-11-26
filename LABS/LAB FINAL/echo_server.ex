##
## echo_server.ex provides module EchoServer, an example of a simple TCP server
## Adapted from Elixir Guides: https://elixir-lang.org/getting-started/mix-otp/task-and-gen-tcp.html
##

defmodule EchoServer do
  @moduledoc """
  Documentation for `EchoServer`.
  """

  require Logger

  def accept(port) do
    # The options below mean:
    # 1. `:binary` - receives data as binaries (instead of lists)
    # 2. `packet: :line` - receives data line by line
    # 3. `active: false` - blocks on `:gen_tcp.recv/2` until data is available
    # 4. `reuseaddr: true` - allows us to reuse the address if the listener crashes
    {:ok, socket} =
      :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])

    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    # starts a new Task to handle the client
    {:ok, pid} = Task.start_link(fn -> serve(client) end)
    :ok = :gen_tcp.controlling_process(client, pid)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    socket
    |> read_line()
    |> write_line(socket)

    serve(socket)
  end

  defp read_line(socket) do
    {resp, data} = :gen_tcp.recv(socket, 0)

    case resp do
      :ok ->
        IO.inspect(data, label: "incoming data")

      :error ->
        IO.puts("Connection closed, terminating...")
        exit(data)
    end

    data
  end

  defp write_line(line, socket) do
    line = String.upcase(line)
    :gen_tcp.send(socket, line)
  end
end
