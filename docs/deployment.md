# Deployment checklist (quick)

1. Set static IPs for both VMs.
2. On devops VM: follow devops-vm/install-steps.md
3. On monitoring VM: follow monitoring-vm/install-steps.md
4. Update /etc/hosts on both VMs to map DEVOPS_IP and MONITORING_IP (optional)
5. Start services and validate metrics endpoints:
   - curl http://DEVOPS_IP:9100/metrics
   - curl http://DEVOPS_IP:9113/metrics
   - curl http://MONITORING_IP:9090/ (Prometheus)
   - Grafana on http://MONITORING_IP:3000
6. Run load tests in scripts/ and observe Grafana dashboards
