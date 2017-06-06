defmodule GraphqlSydney.Repo.Migrations.AddSubtitleToMeetup do
  use Ecto.Migration

  def change do
    alter table(:meetup) do
      add :subtitle, :string
    end
  end
end
