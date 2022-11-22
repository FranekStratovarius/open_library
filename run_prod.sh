# get dependencies
mix deps.get --only prod
# compile
MIX_ENV=prod mix compile
# compile assets
MIX_ENV=prod mix assets.deploy

PORT=80 MIX_ENV=prod mix phx.server