# Grafana Loki Log Monitor Dashboard 🚀

A test setup for simulating production-style log monitoring using Docker, Grafana, Loki, Promtail — now enhanced with a Ruby-based dashboard refactor.

<!-- Previously used raw JSON, and manual editing via the Grafana UI -->

Instead of doing a manual edit on `grafana-dashboard.json` and writing a raw LogQL, dashboards are now defined with Ruby DSL and reusable query helpers.

## 📦 Stack Overview

- **Grafana** – Dashboard & visualization
- **Loki** – Log aggregation backend
- **Promtail** – Log shipper from file
- **PowerShell / Ruby** – Custom log generator
- **Docker Compose** – Local dev orchestration
- **Ruby + Bundler** - Dashboards templating and query logic

## 🎯 What This Dashboard Shows

- 🔢 HTTP Successes (Last 5m) – Total logs ingested from a fake HTTP success loop
- 📈 Success Rate (req/s) – Real-time log spike frequency
- ⚙️ Powered by LogQL queries like:

  - `rate({job="spammer"} |= "HTTP client success"[1m])`
  - `count_over_time({job="spammer"} |= "HTTP client success"[5m])`

## 🔄 Ruby Dashboard Refactor

### ✅ Setup (1-time)

```bash
bundle install
```

```bash
rake dashboard:generate > grafana-dashboard.json
```

This replaces the old manual export/import process

**Ruby logic lives in:**

- `dashboards/` - Defines the structure of each dashboard
- `logql/` - Shared query expressions (e.g., `{app="myapp", level="error"}`)
- `scripts/` - Optional log spammer in Ruby
- `lib/` - Placeholder for future Grafana API automation

<!-- Old method:
Manual edits in JSON like this:

{
   "title": "App Logs Dashboard",
   }
-->

---

## 🧪 Generating Logs Locally

To simulate real-time log traffic, use either of the following:

### ▶️ Option A: PowerShell Script (Windows)

```powershell
.\log-spammer.ps1
```

### ▶️ Option B: Ruby Script (Cross-platform)

```bash
ruby scripts/log_spammer.rb
```

Both options generate log lines like:

```
2025-07-23 01:12:35 [INFO] HTTP client success
2025-07-23 01:12:37 [ERROR] Database timeout
2025-07-23 01:12:39 [WARN] Rate limit triggered
```

Logs are written to:

```plaintext
logs/spammer.log
```

Promtail ships those logs to Loki, and they appear in your Grafana under the `spammer` job.

---

## ⚙️ How to Run the Stack

1. Clone the repo:

```bash
git clone https://github.com/professorpoof/lowkey-loki-logs.git
cd lowkey-loki-logs
```

2. Start the stack:

```bash
docker-compose up
```

3. Access Grafana:

- URL: [http://localhost:3000](http://localhost:3000)
- Login: `admin` / `admin`

4. Import the dashboard:

- File: `grafana-dashboard.json` (generated via Ruby)

---

### 👀 Live Log View (optional)

#### PowerShell:

```powershell
Get-Content .\logs\spammer.log -Wait
```

---

#### Bash:

```bash
tail -f logs/spammer.log
```

---

### 🛑 To Stop the Spammer

In the terminal where it's running:

```plaintext
Ctrl + C
```

To clear the log file (optional):

#### PowerShell:

```powershell
Remove-Item .\logs\spammer.log
```

#### Bash:

```bash
rm logs/spammer.log
```

---

### 💡 Future Enhancements

> I mean this was just a little test project lol, unless you have something in store for me? 🤔

- ENV-based dashboard injection (e.g., pass app name)
- Auto-push dashboards via Grafana API (`lib/grafana_client.rb`)
- Multi-env support (dev / stage / prod dashboards)
