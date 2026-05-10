# OCI Compute with Terraform/OpenTofu - Training Examples

This directory contains runnable examples for the **terraform-oci-fk-compute** module.
The examples focus on practical OCI compute deployment patterns, from a single instance to instance pools, autoscaling, and load balancer integration.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used across OCI and multicloud courses covering networking, compute, autoscaling, traffic distribution, and architecture fundamentals.

---

## Published Examples

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Single Instance** | regular OCI compute instance, public subnet path, Oracle Linux 9, cloud-init bootstrap |
| 02 | **Instance Pool with Threshold Autoscaling** | instance pool, threshold autoscaling, private app subnet, OL9 bootstrap |
| 03 | **Instance Pool with Scheduled Autoscaling** | instance pool, scheduled autoscaling, OCI cron expressions, OL9 bootstrap |
| 04 | **Instance Pool with Load Balancer** | compute-driven LB attachment, instance pool, threshold autoscaling, `terraform-oci-fk-loadbalancer` integration |
| 05 | **Multiple Instances with Load Balancer** | multiple regular instances, `count`, static LB backends, `terraform-oci-fk-loadbalancer` integration |

---

## How to Use

The example directory contains:
- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A minimal, runnable architecture

To run the single instance example:

```bash
cd examples/01_single_instance
tofu init
tofu plan
tofu apply
```

To run the threshold autoscaling example:

```bash
cd examples/02_instance_pool_autoscaling
tofu init
tofu plan
tofu apply
```

To run the scheduled autoscaling example:

```bash
cd examples/03_instance_pool_scheduled_autoscaling
tofu init
tofu plan
tofu apply
```

To run the load balancer integration examples:

```bash
cd examples/04_instance_pool_with_load_balancer
tofu init
tofu plan
tofu apply
```

```bash
cd examples/05_multiple_instances_with_load_balancer
tofu init
tofu plan
tofu apply
```

---

## Design Principles

- One example = one architectural goal
- No unused or placeholder resources
- Clear separation of concerns between networking, compute, autoscaling, and load balancing
- Examples designed to integrate with other modules such as VCN and Load Balancer

---

## Related Resources

- [FoggyKitchen OCI Compute Module (terraform-oci-fk-compute)](../)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/mlinxfeld/terraform-oci-fk-vcn)
- [FoggyKitchen OCI Load Balancer Module (terraform-oci-fk-loadbalancer)](https://github.com/mlinxfeld/terraform-oci-fk-loadbalancer)
- [FoggyKitchen Azure Compute Module (terraform-az-fk-compute)](https://github.com/mlinxfeld/terraform-az-fk-compute)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../LICENSE) for details.

---

© 2026 FoggyKitchen.com - Cloud. Code. Clarity.
