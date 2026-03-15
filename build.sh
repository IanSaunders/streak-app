#!/bin/bash
set -e

echo "=== build.sh ==="
[ -n "$STRAVA_CLIENT_ID" ]     && echo "STRAVA_CLIENT_ID: found"
[ -n "$STRAVA_CLIENT_SECRET" ] && echo "STRAVA_CLIENT_SECRET: found"

if [ -z "$STRAVA_CLIENT_ID" ] || [ -z "$STRAVA_CLIENT_SECRET" ]; then
  echo "WARNING: one or both Strava env vars are empty — config.js will have no credentials"
fi

cat > streak-checker/config.js <<EOF
window.STRAVA_CONFIG = {
  clientId:     '${STRAVA_CLIENT_ID}',
  clientSecret: '${STRAVA_CLIENT_SECRET}',
};
EOF

echo "config.js written"
