# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION-slim as base

LABEL fly_launch_runtime="rails"

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_PATH="vendor/bundle" \
    BUNDLE_WITHOUT="development:test"

# Update gems and preinstall the desired version of bundler
ARG BUNDLER_VERSION=2.4.6
RUN gem update --system --no-document && \
    gem install -N bundler -v ${BUNDLER_VERSION}


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems and node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl libpq-dev libvips node-gyp pkg-config python-is-python3 unzip

# Install JavaScript dependencies
ARG NODE_VERSION=16.0.0
ARG YARN_VERSION=1.22.19
RUN curl -fsSL https://fnm.vercel.app/install | bash && \
    /root/.local/share/fnm/fnm install $NODE_VERSION
ENV PATH=/root/.local/share/fnm/aliases/default/bin/:$PATH
RUN npm install -g yarn@$YARN_VERSION

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle _${BUNDLER_VERSION}_ install && \
    bundle exec bootsnap precompile --gemfile

# Install node modules
COPY package.json yarn.lock .
RUN yarn install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE=DUMMY ./bin/rails assets:precompile


# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y imagemagick libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# # Run and own the application files as a non-root user for security
RUN useradd rails
USER rails:rails

# Copy built application from previous stage
COPY --from=build --chown=rails:rails /rails /rails

# Deployment options
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true"

# Entrypoint sets up the container.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
