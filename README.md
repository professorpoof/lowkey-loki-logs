# Grafana Loki Log Monitor Dashboard 🚀

A test setup for simulating production-style log monitoring using Docker, Grafana, Loki, Promtail, and PowerShell.

Designed to generate fake HTTP success traffic and visualize real-time ingestion using Grafana dashboards powered by LogQL.

## 📦 Stack Overview

- **Grafana** – Dashboard & visualization
- **Loki** – Log aggregation backend
- **Promtail** – Log shipper from file
- **PowerShell** – Custom log generator
- **Docker Compose** – Local dev orchestration

## 🎯 What This Dashboard Shows

- 🔢 HTTP Successes (Last 5m) – Total logs ingested from a fake HTTP success loop
- 📈 Success Rate (req/s) – Real-time line graph showing log spike frequency
- ⚙️ Powered by LogQL queries like:
  - `rate({job="spammer"} |= "HTTP client success"[1m])`
  - `count_over_time({job="spammer"} |= "HTTP client success"[5m])`

## ⚙️ How to Run

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
   - http://localhost:3000  
   - Login: `admin` / `admin`

4. Import the dashboard:
   - File: `grafana-dashboard.json`

---

## 🧪 Generating Logs Locally

To simulate real-time log traffic, use the included PowerShell script:

### ▶️ Start the Log Spammer

From the root of this repo:

```powershell
.\log-spammer.ps1
```

This will generate randomized log lines (INFO, WARN, ERROR) like:

```
2025-07-23 01:12:35 [INFO] HTTP client success  
2025-07-23 01:12:37 [ERROR] Database timeout  
2025-07-23 01:12:39 [WARN] Rate limit triggered
```

Logs are written to:

```plaintext
logs/spammer.log
```

Promtail ships those logs to Loki, where they appear in your Grafana dashboard under the `spammer` job.

---

### 🛑 To Stop the Spammer

In the terminal where it's running, press:

```plaintext
Ctrl + C
```

To clear the log file (optional):
```powershell
Remove-Item .\logs\spammer.log
```

---

### 👀 Live Log View (optional)

You can tail the log in real time with:

```powershell
Get-Content .\logs\spammer.log -Wait
```

This is helpful for debugging or watching logs flow in parallel with Grafana.