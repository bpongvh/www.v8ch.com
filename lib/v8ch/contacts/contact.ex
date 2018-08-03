defmodule V8ch.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias V8ch.Contacts.Contact


  schema "contacts" do
    field :email, :string
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs) do
    contact
    |> cast(attrs, [:email, :message])
    |> validate_required([:email, :message])
  end
end
