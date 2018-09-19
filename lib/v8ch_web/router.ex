defmodule V8chWeb.Router do
  use V8chWeb, :router

  alias V8chWeb.Plugs.GraphQlContext
  alias V8chWeb.GraphQlSchema, as: V8chGraphQlSchema

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    # plug :fetch_session
    # plug :protect_from_forgery
  end

  pipeline :graphql do
    plug(:accepts, ["json"])
    plug(GraphQlContext)
  end

  scope "/", V8chWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/blog", PageController, :index
    get "/dashboard", PageController, :index
    get "/login", AuthenticationController, :login
    get "/logout", AuthenticationController, :logout
    get "/post/add", PageController, :index
    get "/trivia-challenge", PageController, :trivia_challenge
    get "/trivia-challenge/about", PageController, :trivia_challenge
    get "/trivia-challenge/answer/:sequence", PageController, :trivia_challenge
    get "/trivia-challenge/no-results", PageController, :trivia_challenge
    get "/trivia-challenge/quiz/:id", PageController, :trivia_challenge
    get "/trivia-challenge/results", PageController, :trivia_challenge
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", V8chWeb do
    pipe_through :api

    resources "/contact", ContactController, only: [:create]
  end

  # ----------------------
  # GraphQL
  # ----------------------

    scope "/" do
      pipe_through([:graphql])

      forward("/graphql/v1", Absinthe.Plug, schema: V8chGraphQlSchema)
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: V8chGraphQlSchema)
    end
end
