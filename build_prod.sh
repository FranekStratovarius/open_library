# clean created assets
#mix phx.digest.clean --all

# get dependencies
mix local.rebar --force
mix deps.get --only prod
# compile
MIX_ENV=prod mix compile
# compile assets
MIX_ENV=prod mix assets.deploy

# create database
mix ecto.create
# migrate database
mix ecto.migrate