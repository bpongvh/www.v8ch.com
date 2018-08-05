defmodule V8ch.Repo.Migrations.CreateContactsTable do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :email, :string
      add :message, :string

      timestamps()
    end
  end
end
