defmodule V8chWeb.ContactView do
  use Timex
  use V8chWeb, :view

  alias V8chWeb.ContactView

  def render("show.json", %{contact: contact}) do
    %{
      data: render_one(contact, ContactView, "contact.json")
    }
  end

  def render("contact.json", %{contact: contact}) do
    %{
      attributes: %{
        email: contact.email,
        insertedAt: Timex.format!(contact.inserted_at, "{ISO:Extended:Z}"),
        message: contact.message
      },
      # guid: contact.guid,
      type: "contact"
    }
  end
end
