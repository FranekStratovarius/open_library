FROM alpine:3.16

# install elixir
RUN apk add --no-cache \
	elixir

ENV MIX_ENV=prod

RUN mix local.hex phx_new --force

COPY .	/code
WORKDIR /code

RUN /code/build_prod.sh

CMD /code/run_prod.sh