FROM python:2.7.13-slim

# Install packages
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get update && apt-get install -y \
    build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev libpq-dev libmemcached-dev libcurl4-gnutls-dev \
    g++ \
	curl \
    git \
    nginx \
    apt-transport-https \
    ruby-full rubygems \
	&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list - \
    && apt-get update && apt-get install -y yarn \
	nodejs \
    && pip install --upgrade pip \
    && rm -rf /var/lib/apt/lists/*
