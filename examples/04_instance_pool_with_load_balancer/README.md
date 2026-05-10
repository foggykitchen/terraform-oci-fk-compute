# Example 04: Instance Pool With Load Balancer

This example composes:

- `terraform-oci-fk-vcn`
- `terraform-oci-fk-loadbalancer`
- `terraform-oci-fk-compute`

It mirrors the `02_public_lb_instance_pool` scenario from the load balancer repository,
but keeps the focus on how the compute module participates in the integration through
`lb_attachment`, Oracle Linux 9, threshold autoscaling, and the shared demo cloud-init bootstrap.

## Highlights

- private backend subnet for pool members
- public subnet for the OCI Load Balancer
- pool attachment driven by `module.loadbalancer.lb_attachment`
- OL9 image path plus bootstrapped HTTP demo service on port `80`

## Verification Screens

<img src="04_instance_pool_with_load_balancer_lb_status.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_lb_backend_status.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_status.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_instance_configuration.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_attached_instances.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_autoscaling_configuration.png" width="900"/>

<img src="04_instance_pool_with_load_balancer_lb_http_access.png" width="900"/>
