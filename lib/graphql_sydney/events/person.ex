defmodule GraphqlSydney.Events.Person do
  use Ecto.Schema

  alias GraphqlSydney.Events.Talk

  schema "person" do
    field :name, :string
    field :avatar_url, :string
    field :meetup_url, :string
    field :website_url, :string
    field :twitter, :string

    has_many :talks, Talk, foreign_key: :presenter_id
  end

end
