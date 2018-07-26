defmodule V8chWeb.ContactController do
  import Bamboo.Email
  use V8chWeb, :controller

  alias V8ch.Contacts
  alias V8chWeb.ContactView
  alias V8chWeb.ChangesetView
  alias V8ch.Mailer

  def create(conn, %{"email" => email, "message" => message}) do
    case Contacts.create_contact(%{email: email, message: message}) do
      {:ok, contact} ->
        message =
          new_email
          |> to("bpong@v8ch.com")
          |> from(email)
          |> subject("v8ch.com Contact Message from #{email}")
          |> text_body(message)

          message
          |> Mailer.deliver_later
        conn
        |> render(ContactView, "contact.json", %{contact: contact})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChangesetView, "error.json", changeset: changeset)
    end
  end
end
