defmodule GraphqlSydney.Repo.Migrations.AddOtherIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:person, :name)
    create unique_index(:meetup, :slug)
  end
end
