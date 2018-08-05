defmodule V8ch.ContentTypes.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias V8ch.ContentTypes.Post


  schema "posts" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:content, :title])
    |> validate_required([:content, :title])
  end
end
