defmodule GraphqlSydney.Repo.Migrations.SplitAddressFields do
  use Ecto.Migration

  def change do
    alter table(:location) do
      add :street_address, :string, null: false
      add :suburb, :string, null: false, default: "Sydney"
      add :state, :string, null: false, default: "NSW"
      add :postcode, :string, null: false, default: "2000"
      add :country, :string, null: false, default: "Australia"
    end
  end
end
