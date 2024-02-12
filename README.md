# Research_Thesis

---------- Kind CLuster Deployment ------------

Our cluster has one Master and two worker nodes.

# Dependencies to be installed
1. Kind
2. Kubectl (To access Cluster through CLI)
3. OpenLens (Optional) (Application access to cluster)

kind create cluster  --config=./Cluster.yaml

---------- Deploy Prometheus and Grafana ----------

1. $ kubectl apply --server-side -f manifests/setup until kubectl get servicemonitors --all-namespaces ;do date; sleep 1; echo ""; done

2. $ kubectl apply -f manifests/

# To check cluster data from Prometheus UI, we need to forward the Prometheus port to local host.

$ kubectl -n monitoring port-forward service/prometheus-k8s 8080
-> Forwarding from 127.0.0.1:3000 -> 3000

# To visualize cluster data from Grafana UI, we need to forward the Grafana port to local host.

$ kubectl -n monitoring port-forward service/grafana 3000
-> Forwarding from 127.0.0.1:3000 -> 3000

