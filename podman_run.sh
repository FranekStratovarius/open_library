## build image
# podman build --file Dockerfile \
# 	--tag campus-connect-library \
# 	.

## create pod
podman pod create --name open_library --label open_library --publish 4000:4000

## start and add container to pod
podman run -dt --pod open_library \
	--env PGUSER=user \
	--env POSTGRES_USER=user \
	--env POSTGRES_PASSWORD=password \
	--env POSTGRES_DB=database \
	--volume ./data:/var/lib/postgresql/data \
	postgres:15.1-alpine3.17

## start and add container to pod
podman run -dt --pod open_library \
	--env TZ=Europe/Berlin \
	--env PORT=4000 \
	--env DATABASE_URL=postgresql://user:password@localhost:5432/database \
	--env SECRET_KEY_BASE=LCEMBgp+TUlWBtjPa5Gf4gOum+8X4UNQjmlT62Od7gsLmKr76aXY9AXm825CRFht \
	campus-connect-library