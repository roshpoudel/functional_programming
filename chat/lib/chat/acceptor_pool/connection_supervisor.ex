#---
# Excerpted from "Network Programming in Elixir and Erlang",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/alnpee for more book information.
#---
defmodule Chat.AcceptorPool.ConnectionSupervisor do
  use DynamicSupervisor

  @spec start_link(keyword()) :: Supervisor.on_start()
  def start_link(options) do
    DynamicSupervisor.start_link(__MODULE__, options, name: __MODULE__) 
  end

  @spec start_connection(:gen_tcp.socket()) :: Supervisor.on_start()
  def start_connection(socket) do 
    DynamicSupervisor.start_child(__MODULE__, {Chat.Connection, socket})
  end

  @impl true
  def init(_options) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end