output "kms_keys_id" {
  description = "Map of id values across all kms_keys, keyed the same as var.kms_keys except keys with no id are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kms_keys_auto_key_rotation_details" {
  description = "Map of auto_key_rotation_details values across all kms_keys, keyed the same as var.kms_keys except keys with no auto_key_rotation_details are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => one(v.auto_key_rotation_details) if v.auto_key_rotation_details != null && length(v.auto_key_rotation_details) > 0 }
}
output "kms_keys_compartment_id" {
  description = "Map of compartment_id values across all kms_keys, keyed the same as var.kms_keys except keys with no compartment_id are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "kms_keys_current_key_version" {
  description = "Map of current_key_version values across all kms_keys, keyed the same as var.kms_keys except keys with no current_key_version are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.current_key_version if v.current_key_version != null && length(v.current_key_version) > 0 }
}
output "kms_keys_defined_tags" {
  description = "Map of defined_tags values across all kms_keys, keyed the same as var.kms_keys except keys with no defined_tags are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "kms_keys_desired_state" {
  description = "Map of desired_state values across all kms_keys, keyed the same as var.kms_keys except keys with no desired_state are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.desired_state if v.desired_state != null && length(v.desired_state) > 0 }
}
output "kms_keys_display_name" {
  description = "Map of display_name values across all kms_keys, keyed the same as var.kms_keys except keys with no display_name are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "kms_keys_external_key_reference" {
  description = "Map of external_key_reference values across all kms_keys, keyed the same as var.kms_keys except keys with no external_key_reference are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => one(v.external_key_reference) if v.external_key_reference != null && length(v.external_key_reference) > 0 }
}
output "kms_keys_external_key_reference_details" {
  description = "Map of external_key_reference_details values across all kms_keys, keyed the same as var.kms_keys except keys with no external_key_reference_details are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.external_key_reference_details if v.external_key_reference_details != null && length(v.external_key_reference_details) > 0 }
}
output "kms_keys_freeform_tags" {
  description = "Map of freeform_tags values across all kms_keys, keyed the same as var.kms_keys except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "kms_keys_is_auto_rotation_enabled" {
  description = "Map of is_auto_rotation_enabled values across all kms_keys, keyed the same as var.kms_keys except keys with no is_auto_rotation_enabled are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.is_auto_rotation_enabled if v.is_auto_rotation_enabled != null }
}
output "kms_keys_is_primary" {
  description = "Map of is_primary values across all kms_keys, keyed the same as var.kms_keys except keys with no is_primary are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.is_primary if v.is_primary != null }
}
output "kms_keys_key_shape" {
  description = "Map of key_shape values across all kms_keys, keyed the same as var.kms_keys except keys with no key_shape are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => one(v.key_shape) if v.key_shape != null && length(v.key_shape) > 0 }
}
output "kms_keys_management_endpoint" {
  description = "Map of management_endpoint values across all kms_keys, keyed the same as var.kms_keys except keys with no management_endpoint are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.management_endpoint if v.management_endpoint != null && length(v.management_endpoint) > 0 }
}
output "kms_keys_protection_mode" {
  description = "Map of protection_mode values across all kms_keys, keyed the same as var.kms_keys except keys with no protection_mode are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.protection_mode if v.protection_mode != null && length(v.protection_mode) > 0 }
}
output "kms_keys_replica_details" {
  description = "Map of replica_details values across all kms_keys, keyed the same as var.kms_keys except keys with no replica_details are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.replica_details if v.replica_details != null && length(v.replica_details) > 0 }
}
output "kms_keys_restore_from_file" {
  description = "Map of restore_from_file values across all kms_keys, keyed the same as var.kms_keys except keys with no restore_from_file are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => one(v.restore_from_file) if v.restore_from_file != null && length(v.restore_from_file) > 0 }
}
output "kms_keys_restore_from_object_store" {
  description = "Map of restore_from_object_store values across all kms_keys, keyed the same as var.kms_keys except keys with no restore_from_object_store are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => one(v.restore_from_object_store) if v.restore_from_object_store != null && length(v.restore_from_object_store) > 0 }
}
output "kms_keys_restore_trigger" {
  description = "Map of restore_trigger values across all kms_keys, keyed the same as var.kms_keys except keys with no restore_trigger are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.restore_trigger if v.restore_trigger != null }
}
output "kms_keys_restored_from_key_id" {
  description = "Map of restored_from_key_id values across all kms_keys, keyed the same as var.kms_keys except keys with no restored_from_key_id are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.restored_from_key_id if v.restored_from_key_id != null && length(v.restored_from_key_id) > 0 }
}
output "kms_keys_state" {
  description = "Map of state values across all kms_keys, keyed the same as var.kms_keys except keys with no state are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.state if v.state != null && length(v.state) > 0 }
}
output "kms_keys_time_created" {
  description = "Map of time_created values across all kms_keys, keyed the same as var.kms_keys except keys with no time_created are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "kms_keys_time_of_deletion" {
  description = "Map of time_of_deletion values across all kms_keys, keyed the same as var.kms_keys except keys with no time_of_deletion are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.time_of_deletion if v.time_of_deletion != null && length(v.time_of_deletion) > 0 }
}
output "kms_keys_vault_id" {
  description = "Map of vault_id values across all kms_keys, keyed the same as var.kms_keys except keys with no vault_id are omitted"
  value       = { for k, v in oci_kms_key.kms_keys : k => v.vault_id if v.vault_id != null && length(v.vault_id) > 0 }
}

