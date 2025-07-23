\# Grafana Loki Log Monitor Dashboard 🚀



Test simulation of production-style log monitoring stack built with Docker, Grafana, Loki, Promtail, and PowerShell.  

Designed to simulate real-time HTTP success traffic using a log spammer and visualize it through a Grafana dashboard.



---



\## 📦 Stack Overview



\- \*\*Grafana\*\* – Dashboard \& visualization

\- \*\*Loki\*\* – Log aggregation backend

\- \*\*Promtail\*\* – Log shipper from file

\- \*\*PowerShell\*\* – Custom log generator

\- \*\*Docker Compose\*\* – Local dev orchestration



---



\## 🎯 What This Dashboard Shows



\- 🔢 `HTTP Successes (Last 5m)` – Total logs ingested from a fake HTTP success loop  

\- 📈 `Success Rate (req/s)` – Real-time line graph showing log spike frequency  

\- ⚙️ Powered by LogQL queries like:

&nbsp; - `rate({job="spammer"} |= "HTTP client success"\[1m])`

&nbsp; - `count\_over\_time({job="spammer"} |= "HTTP client success"\[5m])`



---



\## ⚙️ How to Run



\### 1. Clone the repo:

```bash

git clone https://github.com/your-username/grafana-loki-dashboard.git

cd grafana-loki-dashboard

🧪 Testing PR creation from feature/docs-update
