## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add dromo https://helm.dromo.io/

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo dromo` to see the charts.

To prepare values.yaml:

    helm show values dromo/dromo > values.yaml

To install the dromo chart for the very first time:

    helm upgrade --install my-dromo dromo/dromo --create-namespace -n dromo --set django.dbMigration.enabled=true --set django.createSuperuser.enabled=true -f values.yaml

To upgrade the dromo chart with database migration:

    helm upgrade --install my-dromo dromo/dromo --create-namespace -n dromo --set django.dbMigration.enabled=true -f values.yaml

To upgrade the dromo chart without database migration:

    helm upgrade --install my-dromo dromo/dromo --create-namespace -n dromo -f values.yaml

To uninstall the chart:

    helm delete my-dromo -n dromo

## Dependency maintenance

The release workflow uses Helm 3.22.1. To reproduce its dependency build and validation:

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm dependency build charts/dromo
    helm lint charts/dromo
    helm template my-dromo charts/dromo

After changing dependencies in `charts/dromo/Chart.yaml`, run `helm dependency update charts/dromo`
and commit the resulting `Chart.lock`. Increment the parent chart version and any modified
local subchart versions together. Dependabot checks GitHub Actions monthly; Helm and container
versions require manual review.

The AWS CLI image is pinned to 2.38.5. The standalone Redis subchart is pinned to 6.2.24;
the parent chart overrides it with the private `redis_tls:latest` image. Private application
images also use `latest` and must be versioned by their image publisher before they can be pinned here.

PostgreSQL remains on chart 12.2.5 for this maintenance pass. Updating to the latest chart
requires a separate database major-version migration and a review of Bitnami's current image
availability and licensing. Existing PostgreSQL image availability has not been validated.
The ECR jobs also download kubectl at runtime; pinning it requires knowing the target cluster version.
