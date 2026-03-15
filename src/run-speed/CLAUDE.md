# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the App

Single-file vanilla JS app — no build step, no package manager.

```bash
python3 -m http.server 8080
# open http://localhost:8080/index.html
```

## Architecture

`index.html` (~1000 lines) contains the entire app: HTML structure, CSS, and JavaScript. All JS dependencies (Chart.js 4.4, chartjs-plugin-annotation 3.0) are loaded via CDN.

**Global state:** `activeDistance` (current tab key) and `userTime` (seconds) drive everything. All charts and the calculator derive from these two values.

**Distance config:** `DISTANCES` object defines 8 distances (mile → 100 mile), each with chart ranges, heatmap parameters, and preset buttons.

**Three visualizations:**
- `renderHeatmap()` — dynamic `<table>` showing % pace improvement needed (rows = finish times, columns = time saved)
- `createChart2()` / `updateChart2ForDistance()` — speed required to save 1 min at various finish times
- `createChart3()` / `updateChart3ForDistance()` — pace vs speed hyperbola with interactive crosshairs

**Data flow:** User input (time input, pace input, or preset button) → parse → set `userTime` → sync paired input → `renderCalcResult()` → `updateAnnotations()` updates all chart overlays.

**Math core:**
```js
speed = 3600 / paceSec          // km/h from sec/km
dv = (3600 * distKm * dt) / (T * (T - dt))  // speed needed to save dt seconds from time T
```

Chart instances are reused (not recreated) on input changes — only annotations and axes update.
