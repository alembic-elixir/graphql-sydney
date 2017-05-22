defmodule GraphqlSydney.Events.Location do
  use Ecto.Schema

  alias GraphqlSydney.Events.Meetup

  schema "location" do
    field :name, :string
    field :street_address, :string
    field :suburb, :string
    field :state, :string
    field :country, :string
    field :postcode, :string
    field :map_url, :string

    has_many :meetups, Meetup
  end
end
