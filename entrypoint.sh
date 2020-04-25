#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [ "$RAILS_ENV" == "development" ]; then
  rails s -p 3000 -b '0.0.0.0'
else
  RAILS_ENV=production rails s -p 3000 -b '0.0.0.0'
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
