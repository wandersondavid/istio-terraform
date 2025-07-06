resource "helm_release" "istiod" {
  name             = "my-istiocontrolplane"
  depends_on       = [helm_release.istio_base]
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "istiod"
  namespace        = "istio-system"
  create_namespace = false
  version          = "1.26.2"

  set = [
    {
    name  = "telemetry.enabled"
    value = "true"
  },
  {
    name  = "meshConfig.ingressService"
    value = "istio-gateway"
  },
 {
    name  = "meshConfig.ingressSelector"
    value = "gateway"
  }
  ]
}
