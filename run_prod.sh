if [[ -z "${PORT}" ]]; then
	# fine, just use default 80 port
	PORT="80"
fi
MIX_ENV=prod mix phx.server