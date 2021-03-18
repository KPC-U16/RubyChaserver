FROM ruby:3.0.0

ENV LANG C.UTF-8
ENV WORKSPACE=/usr/local/src

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# install bundler.
RUN apt-get update && \
    apt-get install -y vim less && \
    apt-get install -y build-essential libpq-dev && \
    gem install bundler && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

# create user and group.
RUN groupadd -r --gid 1000 rails && \
    useradd -m -r --uid 1000 --gid 1000 rails

# create directory.
RUN mkdir -p $WORKSPACE $BUNDLE_APP_CONFIG && \
    chown -R rails:rails $WORKSPACE && \
    chown -R rails:rails $BUNDLE_APP_CONFIG

USER rails
WORKDIR $WORKSPACE

# bundle install.
COPY --chown=rails:rails Rails/ ${WORKSPACE}/
RUN bundle install && \
    bundle update
# COPY --chown=rails:rails database.yml $WORKSPACE/config/database.yml

RUN yarn install

RUN rails db:migrate

EXPOSE  3000
CMD ["rails", "s", "-b", "0.0.0.0"]
