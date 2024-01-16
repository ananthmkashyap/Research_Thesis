provider "kind" {}

resource "kind_cluster" "default" {
    name = var.kind_cluster_name
    node_image = "kindest/node:v1.23.4"
    wait_for_ready = true
    kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
        role = "control-plane"
    }

    node {
        role = "worker"
    }

    node {
        role = "worker"
    }
    }
}

provider "kubectl" {
    host = "${kind_cluster.default.endpoint}"
    cluster_ca_certificate = "${kind_cluster.default.cluster_ca_certificate}"
    client_certificate = "${kind_cluster.default.client_certificate}"
    client_key = "${kind_cluster.default.client_key}"
}

provider "kubernetes" {
    host = "${kind_cluster.default.endpoint}"
    cluster_ca_certificate = "${kind_cluster.default.cluster_ca_certificate}"
    client_certificate = "${kind_cluster.default.client_certificate}"
    client_key = "${kind_cluster.default.client_key}"
    
}

provider "helm" {
    kubernetes {
        host = "${kind_cluster.default.endpoint}"
        cluster_ca_certificate = "${kind_cluster.default.cluster_ca_certificate}"
        client_certificate = "${kind_cluster.default.client_certificate}"
        client_key = "${kind_cluster.default.client_key}"
    }
}

resource "kubernetes_namespace" "monitoring" {
    metadata {
        name = var.namespace
    }
}

resource "helm_release" "kube-prometheus" {

    name       = "kube-prometheus-stackr"
    namespace  = var.namespace
    version    = var.kube-version
    repository = "https://prometheus-community.github.io/helm-charts"
    chart      = "kube-prometheus-stack"
}

resource "helm_release" "kepler"{
    name        = "kepler-exporter"
    namespace   = var.namespace
    version     = "0.5.3"
    repository  = "https://sustainable-computing-io.github.io/kepler-helm-chart"
    chart       = "kepler"     
}
