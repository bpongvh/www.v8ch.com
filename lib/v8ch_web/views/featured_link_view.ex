defmodule V8chWeb.FeaturedLinkView do
  use V8chWeb, :view

  alias V8chWeb.FeaturedLinkView

  def render("show.json", %{featured_link: featured_link}) do
    %{
      data: render_one(featured_link, FeaturedLinkView, "featured_link.json")
    }
  end

  def render("featured_link.json", %{featured_link: featured_link}) do
    %{
      attributes: %{
        description: featured_link.description,
        href: featured_link.href,
        title: featured_link.title
      },
      guid: featured_link.guid,
      type: "featuredLink"
    }
  end
end
