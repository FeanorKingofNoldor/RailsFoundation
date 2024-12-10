#!/bin/bash
set -e

# Setup bundler config
bundle config set --local get.railsdesigner.com ${BUNDLE_GET__RAILSDESIGNER__COM}

# Install dependencies
bundle install

# Build node modules
yarn install

# Execute the main command
exec "$@"