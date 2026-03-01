# Strava Streak Tracker

Shows your current running streak, the next streak number to use in your run title, and validates that past runs are numbered correctly.

## Setup

### 1. Get Strava API credentials

Go to [strava.com/settings/api](https://www.strava.com/settings/api) and create an app (or use an existing one).

Set the **Authorization Callback Domain** to `localhost`.

### 2. Add your credentials

Edit `src/config.js`:

```js
const STRAVA_CONFIG = {
  clientId:     'YOUR_CLIENT_ID',
  clientSecret: 'YOUR_CLIENT_SECRET',
};
```

### 3. Run

```bash
cd src/
python3 -m http.server 8080
```

Open **http://localhost:8080/index.html** and click "Connect with Strava".

## How it works

Name your runs with the streak number as the last number in the title — e.g. `Morning Run 42`. The app tracks consecutive days, shows what number to use next, and flags any runs where the title number is wrong.

## Files

| File | Purpose |
|------|---------|
| `src/index.html` | Entire application (HTML + CSS + JS) |
| `src/config.js` | Your Strava credentials — **do not commit** |
