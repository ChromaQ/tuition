FROM uh-registry.health.unm.edu/devgroup/rails_base:ruby2.7_multidb

ARG RAILS_MASTER_KEY
ARG RAILS_ENV="development"
# Set environemnt variables
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lib/oracle/19.8/client64/bin:/app/bin"
# Datebase connection configurations
ENV ORACLE_HOME="/usr/lib/oracle/19.8/client64" \
    OCI_LIB="/usr/lib/oracle/19.8/client64/lib" \
    TNS_ADMIN="/usr/lib/oracle/19.8/client64/network/admin" \
    LD_LIBRARY_PATH="/usr/lib/oracle/19.8/client64/lib" \
    NLS_LANG="American_America.WE8MSWIN1252" \
    TZ="America/Denver"
# Application and Ruby configurations
ENV APP_HOME="/app" \
    APP_USER="devgroup" \
    BUNDLE_PATH="vendor/cache" \
    RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
    RAILS_ENV=$RAILS_ENV \
    MALLOC_ARENA_MAX=2 \
    BUNDLER_VERSION=2.0
    # MALLOC_ARENA_MAX used to image memory GC cycle performance
    # https://github.com/prestodb/presto/issues/8993
    # https://github.com/heroku/heroku-buildpack-ruby/issues/751

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && \
    unset TZ

# Make app directory, update bundler, and setup volumes
RUN mkdir -p $APP_HOME && \
    gem update --system && gem install bundler --no-document
WORKDIR $APP_HOME

# Copy all applications files into APP_HOME directory
COPY . $APP_HOME
RUN chown -R $APP_USER:$APP_USER $APP_HOME
USER $APP_USER
ENV BUNDLE_PATH="vendor/cache" \
    BUNDLER_VERSION=2.0

# Install all ruby-gems as the $APP_USER and  attempt to get past the UNMH self-signed certs without tls validation
RUN echo ":ssl_verify_mode: 0" >> ~/.gemrc
RUN bundle config set without 'test' && \
    set -ex && bundle check || bundle install --jobs $(nproc) --retry=3 --quiet

# HEALTHCHECK CMD curl -f localhost:3000/healthcheck
RUN ["rails", "assets:precompile"]
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
