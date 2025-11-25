# 🚀 Nginx Performance Degradation Lab

A Complete DevOps Monitoring & Troubleshooting Environment

This repository provides a **production-grade lab** for testing,
analyzing, and diagnosing performance bottlenecks in **Nginx** using
real-world scenarios.\
It includes **load testing**, **metrics collection**, **observability
dashboards**, and an **official diagnosis model** used in enterprise
environments.

------------------------------------------------------------------------

# 📌 Features

-   🔥 Full Nginx slowdown simulation (CPU, network, cache, SSL, WAF,
    DDoS)\
-   📊 Deep monitoring with **Prometheus + Grafana**\
-   🧪 Load‑testing suite: `wrk`, `ab`, `hey`, `k6`\
-   🧠 Official Nginx slowdown diagnostic model\
-   🏗️ Complete multi‑VM environment (DevOps VM + Monitoring VM)\
-   🛠️ Suitable for interviews, portfolio, and production
    troubleshooting

------------------------------------------------------------------------

# 🛡️ Scenarios Covered

## 1️⃣ DDoS / Flood Attacks

**Tools:** `wrk`, `slowloris`, `ab`\
**Metrics:**\
- `nginx_http_requests_total`\
- `nginx_connections_accepted`

------------------------------------------------------------------------

## 2️⃣ SSL / TLS Issues

**Tools:** handshake testers\
**Metrics:**\
- `nginx_handshake_time_seconds`

------------------------------------------------------------------------

## 3️⃣ Cache Dysfunction

**Metrics:**\
- `nginx_cache_hits_total`\
- `nginx_cache_misses_total`

------------------------------------------------------------------------

## 4️⃣ WAF / Lua / ModSecurity Latency

**Metrics:**\
- `nginx_http_request_duration_seconds_bucket`

------------------------------------------------------------------------

## 5️⃣ OS / Kernel / TCP Issues

**Metrics:**\
- `node_network_receive_errors_total`\
- `node_tcp_curr_estab`\
- `node_sockstat_TCP_alloc`

------------------------------------------------------------------------

# 🏋️ Load Testing Toolkit

### Tools included:

-   `wrk`
-   `ab`
-   `hey`
-   `k6`

### Example wrk test:

``` bash
wrk -t4 -c200 -d60s http://DEVOPS_IP/
```

### Required outputs:

-   Average latency\
-   95% & 99% percentile\
-   Req/s\
-   Error counts

------------------------------------------------------------------------

# 🧩 Official Nginx Slowdown Diagnosis Model

### ✅ Nginx is slow if:

1.  High Response Time\
2.  High `nginx_connections_waiting`\
3.  Workers under CPU pressure

**Result:**\
\> Nginx is really the bottleneck.

------------------------------------------------------------------------

### ✅ Nginx is fine if:

1.  Response Time is high\
2.  But CPU & connections are low\
3.  Upstream Response Time is high

**Result:**\
\> 🚀 The problem is Backend, not Nginx.

------------------------------------------------------------------------

# 🗂️ Troubleshooting Layers (in order)

1.  Network Layer\
2.  OS / Kernel\
3.  Nginx Engine\
4.  Upstream / Backend\
5.  DNS / Load Balancer

------------------------------------------------------------------------

# 📁 Project Structure

    devops-vm/
    monitoring-vm/
    docs/
    README.md

------------------------------------------------------------------------

# 🏁 Final Result

This lab provides a **complete DevOps performance ecosystem**:

-   ✔️ Tests Nginx under multiple slowdown scenarios\
-   ✔️ Deep observability with Prometheus & Grafana\
-   ✔️ Identifies whether the bottleneck is Nginx or Backend\
-   ✔️ Ready for portfolio, company demo, or teaching

------------------------------------------------------------------------

# ⭐ Contribution

PRs are welcome! Feel free to add new slowdown scenarios or dashboards.

# 📜 License

MIT License.
