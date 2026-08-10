# oci-sovos-governance — Reference architecture for SOVOS on Oracle EU Sovereign Cloud

2× Ubuntu (SOVOS agents/MCPs) + Oracle Linux A1.Flex (core),
cloud-init bootstraps Docker + Git + uv, daily incremental backups.

`tofu validate` → **Success! The configuration is valid.**

See `main.tf` / `locals.tf` / `variables.tf`. Apache-2.0.
