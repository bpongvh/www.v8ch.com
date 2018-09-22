defmodule V8ch.Repo.Migrations.AlterContactsTableUpdateMessageType do
  use Ecto.Migration

  def up do
    alter table("contacts") do
      modify :message, :text
    end
  end

  def down do
    alter table("contacts") do
      modify :message, :string
    end
  end
end
