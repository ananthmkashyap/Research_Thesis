# Kubernetes-driven ML Workloads:Metrics for Optimization

This Project aims to use Kubernetes Efficient Power Level Exporter (Kepler) tool to extract power consumption metrics of Kubernetes pods during training of ML workloads inorder to optimize the workloads to consume less energy. 

## Hardware Requirements

1. CPU: 2 Cores or more
2. GPU: NVIDIA GPU with CUDA cores
3. Memory: 16 GB or more.
4. Disk Space: 50 GB or more
5. Operating System: Ubuntu (v20 or later)

## Software Requirements
To train ML workloads on GPU nodes in a K8s cluster, some tools must be installed on the host
system.

1. **Docker**:The Minikube Cluster creates nodes and pods that function similarly to Docker
containers. Docker serves as a backend for the cluster, which runs on the host system. To
install Docker on the host, follow this [guide](https://docs.docker.com/desktop/install/linux-install/).

2. **Kubectl**: Similar to Open Lens, Kubectl provides an access to manage the K8s cluster
through command line. Kubectl can be used only upon downloading the config file of the
cluster. Follow the guide [here](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) to install kubectl on the host.

3. **NVIDIA CUDA Toolkit**: CUDA is a programming methodology and platform for parallel
computing. By utilizing the graphics processing unit’s (GPU) power, it allows for a significant
gain in computing performance. The CUDA toolkit can be downloaded by following this [guide](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/contents.html).

4. **NVIDIA Device Plugin for Kubernetes**: The NVIDIA device plugin is a Daemonset which
allows you to Use containers with GPU support in your Kubernetes cluster. The plugin can be deployed using a Helm chart from [here](https://artifacthub.io/packages/helm/nvidia-k8s-device-plugin/nvidia-device-plugin).

5. **Minikube**: A GPU enabled Kubernetes cluster is required for this project. The steps to deploy are given [here](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/).

## Kepler Deployment

The Kepler deployment is based on https://github.com/sustainable-computing-io/kepler.

Out of the various deployment options listed [here](https://sustainable-computing.io/installation/kepler/), the **CI_DEPLOY** and **PROMETHEUS_DEPLOY** options are used in this project.

**To analyze cluster data from Prometheus UI, we need to forward the Prometheus port to local host.**
```kubectl
kubectl -n monitoring port-forward service/prometheus-k8s 8080
```
**To visualize cluster data from Grafana UI, we need to forward the Grafana port to local host.**
```Kubectl
kubectl -n monitoring port-forward service/grafana 3000
```

## Architecture of Implementation
![Architecture Diagram](RP_Arch.drawio.png)

## License
Please refer the license used for Kepler here -  https://github.com/sustainable-computing-io/kepler
