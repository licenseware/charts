# Licenseware Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/licenseware)](https://artifacthub.io/packages/search?repo=licenseware)

## Installation (OCI Registry)

Charts are published to GitHub Container Registry:

```bash
# Install a chart directly
helm install my-release oci://ghcr.io/licenseware/charts/jupyter --version 0.2.3

# Pull a chart
helm pull oci://ghcr.io/licenseware/charts/kafka-connect --version 0.5.0
```

### Using as a dependency

```yaml
dependencies:
  - name: jupyter
    version: "0.2.3"
    repository: "oci://ghcr.io/licenseware/charts"
```

## Legacy Installation (GitHub Pages)

> **Note:** GitHub Pages distribution is deprecated. Please migrate to OCI.

```bash
helm repo add licenseware https://licenseware.github.io/helm-charts/
helm repo update
```
