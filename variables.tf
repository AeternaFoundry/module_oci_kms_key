variable "kms_keys" {
  description = <<EOT
Map of kms_keys, attributes below
Required:
    - compartment_id
    - display_name
    - management_endpoint
    - key_shape (block):
        - algorithm (required)
        - curve_id (optional)
        - length (required)
Optional:
    - defined_tags
    - desired_state
    - freeform_tags
    - is_auto_rotation_enabled
    - protection_mode
    - restore_trigger
    - time_of_deletion
    - auto_key_rotation_details (block):
        - last_rotation_message (optional)
        - last_rotation_status (optional)
        - rotation_interval_in_days (optional)
        - time_of_last_rotation (optional)
        - time_of_next_rotation (optional)
        - time_of_schedule_start (optional)
    - external_key_reference (block):
        - external_key_id (required)
    - restore_from_file (block):
        - content_length (required)
        - content_md5 (optional)
        - restore_key_from_file_details (required)
    - restore_from_object_store (block):
        - bucket (optional)
        - destination (required)
        - namespace (optional)
        - object (optional)
        - uri (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id           = string
    display_name             = string
    management_endpoint      = string
    defined_tags             = optional(map(string))
    desired_state            = optional(string)
    freeform_tags            = optional(map(string))
    is_auto_rotation_enabled = optional(bool)
    protection_mode          = optional(string)
    restore_trigger          = optional(bool)
    time_of_deletion         = optional(string)
    key_shape = object({
      algorithm = string
      curve_id  = optional(string)
      length    = number
    })
    auto_key_rotation_details = optional(object({
      last_rotation_message     = optional(string)
      last_rotation_status      = optional(string)
      rotation_interval_in_days = optional(number)
      time_of_last_rotation     = optional(string)
      time_of_next_rotation     = optional(string)
      time_of_schedule_start    = optional(string)
    }))
    external_key_reference = optional(object({
      external_key_id = string
    }))
    restore_from_file = optional(object({
      content_length                = string
      content_md5                   = optional(string)
      restore_key_from_file_details = string
    }))
    restore_from_object_store = optional(object({
      bucket      = optional(string)
      destination = string
      namespace   = optional(string)
      object      = optional(string)
      uri         = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kms_keys : (
        v.desired_state == null || (contains(["ENABLED", "DISABLED"], v.desired_state))
      )
    ])
    error_message = "must be one of: \"ENABLED\", \"DISABLED\""
  }
  validation {
    condition = alltrue([
      for k, v in var.kms_keys : (
        v.restore_from_object_store == null || (contains([for v in ["BUCKET", "PRE_AUTHENTICATED_REQUEST_URI"] : lower(v)], lower(v.restore_from_object_store.destination)))
      )
    ])
    error_message = "must be one of: \"BUCKET\", \"PRE_AUTHENTICATED_REQUEST_URI\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

