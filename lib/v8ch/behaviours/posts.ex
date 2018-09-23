defmodule V8ch.Behaviours.Post do
  alias V8ch.ContentTypes.Post

  @callback get_post(arg :: Integer.t()) :: {:ok, Post.t()}
end
