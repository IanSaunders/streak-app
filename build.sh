#!/bin/bash
set -e

echo "=== build.sh ==="
echo "STRAVA_CLIENT_ID set: ${STRAVA_CLIENT_ID:+yes}"
echo "STRAVA_CLIENT_SECRET set: ${STRAVA_CLIENT_SECRET:+yes}"

if [ -z "$STRAVA_CLIENT_ID" ] || [ -z "$STRAVA_CLIENT_SECRET" ]; then
  echo "WARNING: one or both Strava env vars are empty — config.js will have no credentials"
fi

cat > src/streak-checker/config.js <<EOF
window.STRAVA_CONFIG = {
  clientId:     '${STRAVA_CLIENT_ID}',
  clientSecret: '${STRAVA_CLIENT_SECRET}',
};
EOF

echo "config.js written"
