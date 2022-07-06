## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add dromo https://helm.dromo.dev/

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
