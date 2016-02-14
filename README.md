# Minty

$ mix phoenix.server

To start over and re-seed:
$ mix ecto.drop
# make changes to the model/migration/html
$ mix ecto.create
$ mix ecto.migrate
$ mix run priv/repo/seeds.exs

Note: The `Stream.drop(1)` ignores the first line of the CSV because we are re-defining the headers. See https://github.com/beatrichartz/csv/issues/27

http://stackoverflow.com/questions/34357812/in-elixir-how-do-you-format-numbers-with-string-interpolation

http://www.rymai.me/2015/12/08/populating-database-tables-from-a-csv-in-elixir/

http://www.glydergun.com/diving-into-ecto-part-2/

https://hexdocs.pm/ecto/Ecto.Query.html

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
