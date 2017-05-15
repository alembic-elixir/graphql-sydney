defmodule GraphqlSydney.Events.Talk do
  use Ecto.Schema

  alias GraphqlSydney.Events.Person
  alias GraphqlSydney.Events.Meetup

  schema "talk" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :slide_url, :string
    field :video_url, :string

    belongs_to :presenter, Person
    belongs_to :meetup, Meetup
  end
end
