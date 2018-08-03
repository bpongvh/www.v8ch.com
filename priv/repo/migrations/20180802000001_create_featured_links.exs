defmodule V8ch.Repo.Migrations.CreateFeaturedLinks do
  use Ecto.Migration

  def change do
    create table(:featured_links) do
      add :description, :string
      add :href, :string
      add :title, :string

      timestamps()
    end

  end
end
