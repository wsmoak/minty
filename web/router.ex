defmodule Minty.Router do
  use Minty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Minty do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # mix phoenix.gen.html Transaction transactions account_name:string category:string date:date description:string
    resources "/transactions", TransactionController
    get "/summary", SummaryController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Minty do
  #   pipe_through :api
  # end
end
