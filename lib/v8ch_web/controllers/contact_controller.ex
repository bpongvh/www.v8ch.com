defmodule V8chWeb.ContactController do
  use V8chWeb, :controller

  alias V8ch.Contacts
  alias V8chWeb.ContactView
  alias V8chWeb.ChangesetView

  def create(conn, %{"email" => email, "message" => message}) do
    case Contacts.create_contact(%{email: email, message: message}) do
      {:ok, contact} ->
        conn
        |> render(ContactView, "contact.json", %{contact: contact})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChangesetView, "error.json", changeset: changeset)
    end
  end
end
