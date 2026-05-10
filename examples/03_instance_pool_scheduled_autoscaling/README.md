# Example 03: Instance Pool With Scheduled Autoscaling

This example composes:

- `terraform-oci-fk-vcn`
- `terraform-oci-fk-compute`

It demonstrates scheduled autoscaling for an OCI instance pool,
using OCI cron expressions instead of threshold-based scale decisions.
The example uses Oracle Linux 9 and the shared demo cloud-init bootstrap.

## Highlights

- private backend subnet for pool members
- public and private routing paths created by `terraform-oci-fk-vcn`
- scheduled autoscaling with separate scale-out and scale-in policies
- OL9 image path plus bootstrapped HTTP demo service on port `80`

## Outputs

- `instance_pool_id`
- `autoscaling_configuration_id`
- `vcn_id`
