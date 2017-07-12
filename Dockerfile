FROM hypriot/rpi-ruby

LABEL Description="Devfest 2017 Persitence game scores module" Vendor="SQLI" Version="1.0"

RUN apt-get update && apt-get install -y build-essential

ADD application /application

WORKDIR /application

RUN bundler install

ENTRYPOINT ruby persisentecemodule.rb
