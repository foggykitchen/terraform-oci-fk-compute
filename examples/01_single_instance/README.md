# Example 01: Single Instance

This example composes:

- `terraform-oci-fk-vcn`
- `terraform-oci-fk-compute`

It demonstrates the simplest compute path in this repository:
a single OCI instance launched in a public subnet, using Oracle Linux 9
and the shared demo cloud-init bootstrap.

## Highlights

- one regular OCI compute instance
- public subnet created by `terraform-oci-fk-vcn`
- public IP assigned on the primary VNIC
- OL9 image path plus bootstrapped HTTP demo service on port `80`

## Outputs

- `instance_id`
- `instance_private_ip`
- `instance_public_ip`
- `vcn_id`
