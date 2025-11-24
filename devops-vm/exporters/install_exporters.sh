#!/bin/bash
set -e

# install node_exporter
NODE_VER="1.5.0"
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_VER}/node_exporter-${NODE_VER}.linux-amd64.tar.gz
tar xzf node_exporter-${NODE_VER}.linux-amd64.tar.gz
sudo mv node_exporter-${NODE_VER}.linux-amd64/node_exporter /opt/node_exporter
sudo useradd -rs /bin/false nodeexp || true
sudo chown nodeexp:nodeexp /opt/node_exporter

# create systemd unit
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<'EOF'
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=nodeexp
Group=nodeexp
Type=simple
ExecStart=/opt/node_exporter --web.listen-address=:9100
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter

# install nginx-prometheus-exporter
NGINX_EXPORTER_VER="0.10.1"
wget https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v${NGINX_EXPORTER_VER}/nginx-prometheus-exporter_${NGINX_EXPORTER_VER}_linux_amd64.tar.gz
mkdir -p /tmp/ngexp
tar xzf nginx-prometheus-exporter_${NGINX_EXPORTER_VER}_linux_amd64.tar.gz -C /tmp/ngexp
sudo mv /tmp/ngexp/nginx-prometheus-exporter /opt/nginx-prometheus-exporter
sudo useradd -rs /bin/false ngexp || true
sudo chown ngexp:ngexp /opt/nginx-prometheus-exporter

sudo tee /etc/systemd/system/nginx_exporter.service > /dev/null <<'EOF'
[Unit]
Description=Nginx Prometheus Exporter
After=network.target

[Service]
User=ngexp
Group=ngexp
ExecStart=/opt/nginx-prometheus-exporter -nginx.scrape-uri=http://127.0.0.1:8080/nginx_status --web.listen-address=:9113
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now nginx_exporter

# done
echo "node_exporter and nginx_exporter installed and started"
