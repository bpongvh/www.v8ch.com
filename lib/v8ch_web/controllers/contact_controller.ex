defmodule V8chWeb.ContactController do
  import Bamboo.Email
  use V8chWeb, :controller

  alias V8chWeb.ContactView
  alias V8ch.Mailer

  @contacts_module Application.get_env(:v8ch, :contacts_module)

  action_fallback(V8chWeb.FallbackController)

  def create(conn, params) do
    with {:ok, contact} <- @contacts_module.create_contact(params) do
      mail_to = Application.get_env(:v8ch, V8chWeb.ContactController)[:mail_to]

      message =
        new_email()
        |> to(mail_to)
        |> from(contact.email)
        |> subject("v8ch.com Contact Message from #{contact.email}")
        |> text_body(contact.message)

      message
      |> Mailer.deliver_later()

      conn
      |> render(ContactView, "contact.json", %{contact: contact})
    end
  end
end
