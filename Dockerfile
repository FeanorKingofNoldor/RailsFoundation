FROM ruby:3.3.0-slim

# Install essential Linux packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libpq-dev \
    postgresql-client \
    node-gyp \
    pkg-config \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Install Node.js and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

WORKDIR /app

# Copy dependency files
COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

# Copy application code
COPY . .

# Add script to wait for database
COPY .docker/wait-for-it.sh /usr/bin/wait-for-it
RUN chmod +x /usr/bin/wait-for-it

# Add entrypoint script
COPY .docker/entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

EXPOSE 3000
ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]