# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlSydney.Repo.insert!(%GraphqlSydney.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlSydney.Repo
alias GraphqlSydney.Events.{Meetup, Talk, Person, Location}

we_work = Repo.insert!(
  %Location{
    name: "WeWork, 100 Harris St, Pyrmont 2009",
    map_url: "https://www.google.com.au/maps/place/WeWork+Pyrmont/@-33.8684613,151.1937766,15z/data=!4m5!3m4!1s0x0:0x284bed171a7c5347!8m2!3d-33.8684613!4d151.1937766"
  }, on_conflict: :replace_all, conflict_target: :name
)

josh_price = Repo.insert!(
  %Person{
    name: "Josh Price",
    avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/4/5/c/e/member_12197870.jpeg",
    meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/8425371/",
    website_url: "http://alembic.com.au",
    twitter: "@joshprice"
  }, on_conflict: :replace_all, conflict_target: :name
)

james_sadler = Repo.insert!(
  %Person{
    name: "James Sadler",
    avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/2/8/f/b/member_258850491.jpeg",
    meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/202221787/",
    website_url: "http://alembic.com.au",
    twitter: "@freshtonic"
  }, on_conflict: :replace_all, conflict_target: :name
)

raw_meetups = [
  %Meetup{
    title: "First GraphQL Sydney Meetup",
    slug: "first-graphql-sydney-meetup",
    date: ~D[2017-06-08],
    location: we_work,
    description: """
    We're bringing together everyone who is as excited about the potential of GraphQL as we are.

    A varierty of shorter talks from GraphQL practitioners will cover all aspects of GraphQL from frontend to backend.

    Some light food as well as craft beer and cider on tap will be available.
    """,
    url: "https://www.meetup.com/GraphQL-Sydney/events/237438330/",
    talks: [
      %Talk{
        title: "The GraphQL Landscape",
        slug: "the-graphql-landscape",
        description: """
        For such a relatively young API technology, GraphQL has won hearts and minds.
        The Community has grown rapidly and created a rich ecosystem of useful tooling.

        Josh will present a high level overview of the GraphQL ecosystem, the tech,
        as well as the companies who are building GraphQL APIs.
        """,
        presenter: josh_price
      }
    ]
  }
]

for raw_meetup <- raw_meetups do
  GraphqlSydney.Repo.insert!(raw_meetup, on_conflict: :replace_all, conflict_target: :slug)
end
