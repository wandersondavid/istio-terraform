resource "helm_release" "istio-base" {
  name = "my-istio-base-release"

  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  namespace =  "istio-system"
  create_namespace = true
  version = "1.26.2"


  set {
    name  = "global.istioNamespace"
    value = "istio-system"
  }

}