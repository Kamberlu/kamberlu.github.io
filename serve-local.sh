#!/usr/bin/env bash
# Serve the site locally at http://localhost:4000
# Usage: ./serve-local.sh [extra jekyll args]
set -euo pipefail
cd "$(dirname "$0")"

# Sass chokes on UTF-8 characters under a non-UTF-8 locale
export LANG="${LANG:-C.UTF-8}"
export LC_ALL="${LC_ALL:-C.UTF-8}"

bundle install
JEKYLL_ENV=development exec bundle exec jekyll serve \
  --config _config.yml,_config.dev.yml,_config.local.yml \
  --host 0.0.0.0 --port 4000 "$@"
