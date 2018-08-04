defmodule V8ch.ContentTypesTest do
  use V8ch.DataCase

  alias V8ch.ContentTypes

  describe "FEATURED LINKS CONTEXT MODULE" do
    alias V8ch.ContentTypes.FeaturedLink

    @valid_attrs %{description: "some description", href: "some href", title: "some title"}
    @update_attrs %{description: "some updated description", href: "some updated href", title: "some updated title"}
    @invalid_attrs %{description: nil, href: nil, title: nil}

    def featured_link_fixture(attrs \\ %{}) do
      {:ok, featured_link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentTypes.create_featured_link()

      featured_link
    end

    test "list_featured_links/0 returns all featured_links" do
      featured_link = featured_link_fixture()
      assert ContentTypes.list_featured_links() == [featured_link]
    end

    test "get_featured_link!/1 returns the featured_link with given id" do
      featured_link = featured_link_fixture()
      assert ContentTypes.get_featured_link!(featured_link.id) == featured_link
    end

    test "create_featured_link/1 with valid data creates a featured_link" do
      assert {:ok, %FeaturedLink{} = featured_link} = ContentTypes.create_featured_link(@valid_attrs)
      assert featured_link.description == "some description"
      assert featured_link.href == "some href"
      assert featured_link.title == "some title"
    end

    test "create_featured_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentTypes.create_featured_link(@invalid_attrs)
    end

    test "update_featured_link/2 with valid data updates the featured_link" do
      featured_link = featured_link_fixture()
      assert {:ok, featured_link} = ContentTypes.update_featured_link(featured_link, @update_attrs)
      assert %FeaturedLink{} = featured_link
      assert featured_link.description == "some updated description"
      assert featured_link.href == "some updated href"
      assert featured_link.title == "some updated title"
    end

    test "update_featured_link/2 with invalid data returns error changeset" do
      featured_link = featured_link_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentTypes.update_featured_link(featured_link, @invalid_attrs)
      assert featured_link == ContentTypes.get_featured_link!(featured_link.id)
    end

    test "delete_featured_link/1 deletes the featured_link" do
      featured_link = featured_link_fixture()
      assert {:ok, %FeaturedLink{}} = ContentTypes.delete_featured_link(featured_link)
      assert_raise Ecto.NoResultsError, fn -> ContentTypes.get_featured_link!(featured_link.id) end
    end

    test "change_featured_link/1 returns a featured_link changeset" do
      featured_link = featured_link_fixture()
      assert %Ecto.Changeset{} = ContentTypes.change_featured_link(featured_link)
    end
  end
end
