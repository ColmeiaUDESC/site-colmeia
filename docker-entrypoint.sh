#!/bin/bash

set -e

yarn install
bundle install --jobs 4

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Run the command.
exec "$@"   