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