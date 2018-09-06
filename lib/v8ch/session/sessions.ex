defmodule V8ch.Sessions do
    use Timex
    import Ecto.Query, warn: false

    @behaviour V8ch.Behaviours.Sessions

    def create_session(_code) do
      {:ok}
    end
  end
