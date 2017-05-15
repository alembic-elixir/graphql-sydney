defmodule GraphqlSydney.Repo.Migrations.AddLocationIndex do
  use Ecto.Migration

  def change do
    create unique_index(:location, :name)
  end
end
