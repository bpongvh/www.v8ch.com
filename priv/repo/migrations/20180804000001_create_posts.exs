defmodule V8ch.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :string
      add :title, :string

      timestamps()
    end

  end
end
