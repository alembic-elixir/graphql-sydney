defmodule GraphqlSydney.Web.Router do
  use GraphqlSydney.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      json_decoder: Poison
  end

  scope "/", GraphqlSydney.Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/meetups", PageController, :meetups
    get "/meetup/:slug", PageController, :meetup, param: "slug"
  end

  scope "/graphql" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: GraphqlSydney.GraphQL.Schema
  end

  scope "/graphiql" do
    pipe_through :api

    forward "/", Absinthe.Plug.GraphiQL,
      schema: GraphqlSydney.GraphQL.Schema
  end
end
