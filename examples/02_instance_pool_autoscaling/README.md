# Example 02: Instance Pool With Threshold Autoscaling

This example composes:

- `terraform-oci-fk-vcn`
- `terraform-oci-fk-compute`

It demonstrates the OCI-native scale-out path based on:

- instance configuration
- instance pool
- threshold autoscaling

The example uses Oracle Linux 9 and the shared demo cloud-init bootstrap.

## Highlights

- private backend subnet for pool members
- public and private routing paths created by `terraform-oci-fk-vcn`
- threshold-based autoscaling driven by CPU utilization
- OL9 image path plus bootstrapped HTTP demo service on port `80`

## Outputs

- `instance_pool_id`
- `autoscaling_configuration_id`
- `vcn_id`
