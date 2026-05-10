# Example 05: Multiple Instances With Load Balancer

This example composes:

- `terraform-oci-fk-vcn`
- `terraform-oci-fk-loadbalancer`
- `terraform-oci-fk-compute`

It mirrors the `01_public_lb_multiple_instances` scenario from the load balancer
repository and demonstrates how the compute module can be instantiated with `count`
to produce multiple Oracle Linux 9 backends, each bootstrapped by the same improved
cloud-init and attached to the load balancer as static private-IP backends.

## Highlights

- multiple regular instances in the private subnet
- public OCI Load Balancer in the public subnet
- static backend registrations built from `module.compute[*].instance_private_ip`
- OL9 image path plus bootstrapped HTTP demo service on port `80`

## Verification Screens

<img src="05_multiple_instances_with_load_balancer_lb_status.png" width="900"/>

<img src="05_multiple_instances_with_load_balancer_backends_healthy.png" width="900"/>

<img src="05_multiple_instances_with_load_balancer_http_access_via_lb.png" width="900"/>
