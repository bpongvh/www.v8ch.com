defmodule V8ch.Behaviours.Contexts do
    @callback get_user_from_jwt(arg :: String.t()) :: %{}
    @callback verify_jwt(arg :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  end