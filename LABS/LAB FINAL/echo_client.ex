defmodule EchoClient do
  def client(port) do
    opts = [:binary, active: false, packet: :raw]
    {:ok, sock} = :gen_tcp.connect({127, 0, 0, 1}, port, opts)
    :ok = :gen_tcp.send(sock, "Hey how ya doing?\n")
    {:ok, data} = :gen_tcp.recv(sock, 0)
    IO.puts(data)
    :ok = :gen_tcp.send(sock, "I asked you first\n")

    {:ok, data} = :gen_tcp.recv(sock, 0)
    IO.puts(data)
    :ok = :gen_tcp.send(sock, "No, you didn't dummy!\n")

    {:ok, data} = :gen_tcp.recv(sock, 0)
    IO.puts(data)
    :ok = :gen_tcp.close(sock)
  end
end
