defmodule V8ch.ContentTypes do
  @moduledoc """
  The ContentTypes context.
  """

  import Ecto.Query, warn: false

  @behaviour V8ch.Behaviours.FeaturedLink

  alias V8ch.Repo
  alias V8ch.ContentTypes.FeaturedLink

  @doc """
  Returns the list of featured_links.

  ## Examples

      iex> list_featured_links()
      [%FeaturedLink{}, ...]

  """
  def list_featured_links do
    Repo.all(FeaturedLink)
  end

  @doc """
  Gets a single featured_link.

  Raises `Ecto.NoResultsError` if the Featured link does not exist.

  ## Examples

      iex> get_featured_link!(123)
      %FeaturedLink{}

      iex> get_featured_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_featured_link!(id), do: Repo.get!(FeaturedLink, id)

  @doc """
  Creates a featured_link.

  ## Examples

      iex> create_featured_link(%{field: value})
      {:ok, %FeaturedLink{}}

      iex> create_featured_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_featured_link(%{"description" => description, "href" => href, "title" => title}) do
    %FeaturedLink{}
    |> FeaturedLink.changeset(%{
      description: description,
      guid: Ecto.UUID.generate(),
      href: href,
      title: title
    })
    |> Repo.insert()
  end

  @doc """
  Updates a featured_link.

  ## Examples

      iex> update_featured_link(featured_link, %{field: new_value})
      {:ok, %FeaturedLink{}}

      iex> update_featured_link(featured_link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_featured_link(%FeaturedLink{} = featured_link, attrs) do
    featured_link
    |> FeaturedLink.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FeaturedLink.

  ## Examples

      iex> delete_featured_link(featured_link)
      {:ok, %FeaturedLink{}}

      iex> delete_featured_link(featured_link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_featured_link(%FeaturedLink{} = featured_link) do
    Repo.delete(featured_link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking featured_link changes.

  ## Examples

      iex> change_featured_link(featured_link)
      %Ecto.Changeset{source: %FeaturedLink{}}

  """
  def change_featured_link(%FeaturedLink{} = featured_link) do
    FeaturedLink.changeset(featured_link, %{})
  end
end
