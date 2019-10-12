FROM ruby:2.4.5
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  libgmp3-dev \
  postgresql-client-9.6
RUN mkdir /myapp
WORKDIR /myapp
EXPOSE 3000
COPY . /myapp
ARG BUNDLE_INSTALL_ARGS
ARG RAILS_ENV=development
RUN bundle install ${BUNDLE_INSTALL_ARGS}
RUN if [ "$RAILS_ENV" = "production" ]; then SECRET_TOKEN=$(rake secret) bundle exec rake assets:precompile; fi
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
