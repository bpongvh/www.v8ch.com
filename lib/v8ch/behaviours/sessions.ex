defmodule V8ch.Behaviours.Sessions do

  @callback create_session(arg :: %{code: String.t()}) :: {:ok}
end
