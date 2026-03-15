#!/bin/bash
cat > src/streak-checker/config.js <<EOF
window.STRAVA_CONFIG = {
  clientId:     '${STRAVA_CLIENT_ID}',
  clientSecret: '${STRAVA_CLIENT_SECRET}',
};
EOF
