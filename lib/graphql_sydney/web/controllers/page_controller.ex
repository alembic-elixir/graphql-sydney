defmodule GraphqlSydney.Web.PageController do
  use GraphqlSydney.Web, :controller

  alias GraphqlSydney.Events

  def index(conn, _params) do
    next_meetup = Events.next_meetup()

    render(
      conn,
      "index.html",
      meetup: next_meetup,
      page_name: "home",
      title: next_meetup.title
    )
  end

  def about(conn, _params) do
    render(
      conn,
      "about.html",
      page_name: "about",
      title: "About"
    )
  end

  def code_of_conduct(conn, _params) do
    render(
      conn,
      "code_of_conduct.html",
      page_name: "code_of_conduct",
      title: "Code of Conduct"
    )
  end

  def meetups(conn, _params) do
    next_meetup = Events.next_meetup()

    render(
      conn,
      "meetups.html",
      next_meetup: next_meetup,
      past_meetups: Events.past_meetups(),
      all_meetups: Events.all_meetups(),
      page_name: "meetups",
      title: next_meetup.title
    )
  end

  def meetup(conn, %{"slug" => slug}) do
    meetup = Events.meetup_for_slug(slug)

    if meetup do
      render(
        conn,
        "meetup.html",
        meetup: meetup,
        page_name: "meetup",
        title: meetup.title
      )
    else
      redirect(conn, to: page_path(conn, :meetups))
    end
  end
end
