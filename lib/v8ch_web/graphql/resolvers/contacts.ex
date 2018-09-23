defmodule V8chWeb.GraphQlResolvers.Contacts do
  @contacts_module Application.get_env(:v8ch, :contacts_module)

  def create_contact(_, %{data: params}, _) do
    with {:ok, contact} <- @contacts_module.create_contact(params) do
      {:ok, %{contact: contact}}
    end
  end

  def delete_contact(_, %{id: id}, _) do
    with {:ok, contact} <- fetch_contact(id),
        {:ok, deleted} <- @contacts_module.delete_contact(contact) do
      {:ok, %{contact: deleted}}
    end
  end

  def update_contact(_, %{data: params}, _) do
    with {:ok, contact} <- fetch_contact(params.id),
        {:ok, updated} <- @contacts_module.update_contact(contact, params) do
      {:ok, %{contact: updated}}
    end
  end

  defp fetch_contact(id) do
    contact = @contacts_module.get_contact(id)
    case contact do
      nil -> {:error, "CONTACT_NOT_FOUND"}
      _ -> {:ok, contact}
    end
  end
end
