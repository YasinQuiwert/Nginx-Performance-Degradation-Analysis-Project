# نصب روی monitoring VM (Ubuntu/Debian مثال)

# نصب Prometheus
# دانلود باینری Prometheus به /opt/prometheus و ایجاد کاربر prometheus

# نصب Alertmanager
# دانلود باینری Alertmanager به /opt/alertmanager و unit systemd

# نصب Grafana
# از repo رسمی Grafana نصب کن و فایل provisioning را در /etc/grafana/provisioning قرار بده

# کپی prometheus.yml و reload service
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus
sudo systemctl enable --now alertmanager
sudo systemctl enable --now grafana-server
