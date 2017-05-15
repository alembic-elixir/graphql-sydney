defmodule GraphqlSydney.Events.Location do
  use Ecto.Schema

  alias GraphqlSydney.Events.Meetup

  schema "location" do
    field :name, :string
    field :map_url, :string

    has_many :meetups, Meetup
  end
end
