# سناریوهای تست

1) Load spike
- ابزار: wrk
- دستور: ./devops-vm/scripts/run-wrk.sh http://DEVOPS_IP/ 120 8 800
- هدف: بررسی latency و error rate در Grafana

2) CPU starvation
- راه: محدود کردن php-fpm با systemd drop-in یا تغییر pm.max_children
- بررسی: CPU usage in node_exporter, request latency

3) Disk I/O slow (DB)
- شبیه‌سازی: اجرای کوئری‌های سنگین یا کاهش io scheduler یا استفاده از dd برای اشغال دیسک
- بررسی: MySQL slow_log و افزایش latency

4) Cache miss high
- راه: خاموش کردن Redis یا پاک کردن cache و مشاهده hit/miss در redis metrics

5) Connection saturation
- ابزار: wrk با keepalive، بالا بردن concurrency

برای هر تست: جمع‌آوری metrics 5 دقیقه قبل و بعد، export results و attach logs
