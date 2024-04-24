resource "google_dns_managed_zone" "default" {
  name        = "ian-tech"
  dns_name    = "ian.tech."
  description = "Ian Public DNS zone"
  dnssec_config {
    state = "off"
  }
}

resource "google_dns_record_set" "itp4121" {
  name         = "itp4121.${google_dns_managed_zone.default.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.default.name
  rrdatas      = ["20.29.148.104", "34.92.84.84"]
}
resource "google_compute_http_health_check" "default" {
  name               = "health-check"
  request_path       = "/"
  check_interval_sec = 300
  timeout_sec        = 3
}

resource "google_compute_backend_service" "default" {
  name                = "backend-service"
  port_name           = "http"
  protocol            = "HTTP"
  timeout_sec         = 10
  health_checks       = [google_compute_http_health_check.default.self_link]
  log_config {
    enable = true
  }
}