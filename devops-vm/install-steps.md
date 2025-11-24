# نصب و راه‌اندازی سریع (Ubuntu/Debian مثال)

# 1. بروز کردن و نصب بسته‌های پایه
sudo apt update && sudo apt upgrade -y
sudo apt install -y nginx php8.1-fpm php8.1-mysql mysql-server redis-server wget tar unzip build-essential

# 2. آماده‌سازی WordPress
sudo mkdir -p /srv/wordpress
# دانلود وردپرس و کپی‌کردن (یا از طریق git)
# قرار دادن wp-config.php از wp-config.php.template و تنظیم متغیرها

# 3. کپی کانفیگ nginx
sudo mkdir -p /etc/nginx/sites-enabled
# کپی فایل devops-vm/nginx/nginx.conf -> /etc/nginx/nginx.conf
# کپی devops-vm/nginx/sites-enabled/wordpress.conf -> /etc/nginx/sites-enabled/wordpress.conf
sudo nginx -t && sudo systemctl reload nginx

# 4. PHP-FPM
# کپی devops-vm/php-fpm/www.conf -> /etc/php/8.1/fpm/pool.d/www.conf
sudo systemctl restart php8.1-fpm

# 5. MySQL
# secure installation و ایجاد db/user
sudo mysql_secure_installation
# سپس create database و user با credentials در wp-config

# 6. Redis
# ensure redis-server enabled and running
sudo systemctl enable --now redis-server

# 7. exporters
# کپی install_exporters.sh و اجرا کردن آن برای نصب node_exporter و nginx-prometheus-exporter
sudo bash devops-vm/exporters/install_exporters.sh

# 8. بررسی
# curl http://127.0.0.1:8080/nginx_status
# curl http://127.0.0.1:9113/metrics
# curl http://127.0.0.1:9100/metrics
