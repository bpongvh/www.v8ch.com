defmodule V8ch.Factories.Factory do
  use ExMachina.Ecto, repo: V8ch.Repo
  use V8ch.Factories.FeaturedLink
  use V8ch.Factories.Post
end
