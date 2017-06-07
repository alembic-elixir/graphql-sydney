# GraphqlSydney

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deployment

### Steps for getting Flynn setup

1. Install Flynn

	L=/usr/local/bin/flynn && curl -sSL -A "`uname -sp`" https://dl.flynn.io/cli | zcat >$L && chmod +x $L

2. Add the Alembic cluster

	# Replace FLYNN_TLS_PIN and FLYNN_KEY with values for the Alembic Flynn cluster (in Shared vault in 1Password)
	flynn cluster add -p FLYNN_TLS_PIN alembic grlv.flynnhub.com FLYNN_KEY

3. Add the flynn remote

	git remote add flynn https://git.grlv.flynnhub.com/graphql-sydney.git

### Ship it!

	git push flynn master
