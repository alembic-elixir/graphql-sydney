defmodule GraphqlSydney.Events.Meetup do
  use Ecto.Schema

  alias GraphqlSydney.Events.{Talk, Location}

  schema "meetup" do
    field :title, :string
    field :subtitle, :string
    field :slug, :string
    field :description, :string
    field :url, :string
    field :date, Timex.Ecto.Date

    belongs_to :location, Location
    has_many :talks, Talk
  end

end
