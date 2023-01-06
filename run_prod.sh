if [[ -z "${PORT}" ]]; then
	# fine, just use default 80 port
	PORT="80"
fi

# create database
mix ecto.create
# migrate database
mix ecto.migrate

MIX_ENV=prod mix phx.server