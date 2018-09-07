defmodule V8ch.Behaviours.Contacts do
  alias V8ch.Contacts.Contact

  @callback create_contact(arg :: %{email: String.t(), message: String.t()}) :: {:ok, [Contact.t()]}
  @callback get_contact(arg :: Integer.t()) :: {:ok, [Contact.t()]}
end
