#---
# Excerpted from "Network Programming in Elixir and Erlang",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/alnpee for more book information.
#---
defmodule Chat.Message do
  defmodule Register do
    @type t() :: %__MODULE__{username: String.t()}
    defstruct [:username]
  end

  defmodule Broadcast do
    @type t() :: %__MODULE__{
      from_username: String.t(),
      contents: String.t()
    }

    defstruct [:from_username, :contents]
  end
end
