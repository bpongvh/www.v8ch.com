defmodule V8ch.ContentTypesTest do
  use V8ch.DataCase

  @moduletag :content_types_modules

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

  describe "POSTS CONTEXT MODULE" do
    alias V8ch.ContentTypes.Post

    @valid_attrs %{content: "some content", title: "some title"}
    @update_attrs %{content: "some updated content", title: "some updated title"}
    @invalid_attrs %{content: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentTypes.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert ContentTypes.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert ContentTypes.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = ContentTypes.create_post(@valid_attrs)
      assert post.content == "some content"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentTypes.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = ContentTypes.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.content == "some updated content"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentTypes.update_post(post, @invalid_attrs)
      assert post == ContentTypes.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = ContentTypes.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> ContentTypes.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = ContentTypes.change_post(post)
    end
  end
end
