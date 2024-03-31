FROM ruby:3.1.0
RUN apt-get update && apt-get install -y \
  curl vim wget \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y tzdata nodejs yarn postgresql postgresql-contrib && service postgresql start && su - postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password 'postgrespassword';\""

RUN mkdir textpostapp
COPY textpostapp/ textpostapp/
WORKDIR textpostapp/
RUN bundle install
# RUN gem install rails
