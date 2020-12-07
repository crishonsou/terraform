data "helm_repository" "mycharts" {
  name = "mycharts"
  url  = "https://crishonsou.github.io/mycharts"
}

resource "helm_release" "default" {
  name  = "web-app"
  chart = "mycharts/web-app-chart"

  values = [local.helm_chart_values]

  timeout = 1200
}
