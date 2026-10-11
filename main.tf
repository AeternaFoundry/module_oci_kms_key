resource "oci_kms_key" "kms_keys" {
  for_each = var.kms_keys

  compartment_id           = each.value.compartment_id
  display_name             = each.value.display_name
  management_endpoint      = each.value.management_endpoint
  defined_tags             = each.value.defined_tags
  desired_state            = each.value.desired_state
  freeform_tags            = each.value.freeform_tags
  is_auto_rotation_enabled = each.value.is_auto_rotation_enabled
  protection_mode          = each.value.protection_mode
  restore_trigger          = each.value.restore_trigger
  time_of_deletion         = each.value.time_of_deletion

  key_shape {
    algorithm = each.value.key_shape.algorithm
    curve_id  = each.value.key_shape.curve_id
    length    = each.value.key_shape.length
  }

  dynamic "auto_key_rotation_details" {
    for_each = each.value.auto_key_rotation_details != null ? [each.value.auto_key_rotation_details] : []
    content {
      last_rotation_message     = auto_key_rotation_details.value.last_rotation_message
      last_rotation_status      = auto_key_rotation_details.value.last_rotation_status
      rotation_interval_in_days = auto_key_rotation_details.value.rotation_interval_in_days
      time_of_last_rotation     = auto_key_rotation_details.value.time_of_last_rotation
      time_of_next_rotation     = auto_key_rotation_details.value.time_of_next_rotation
      time_of_schedule_start    = auto_key_rotation_details.value.time_of_schedule_start
    }
  }

  dynamic "external_key_reference" {
    for_each = each.value.external_key_reference != null ? [each.value.external_key_reference] : []
    content {
      external_key_id = external_key_reference.value.external_key_id
    }
  }

  dynamic "restore_from_file" {
    for_each = each.value.restore_from_file != null ? [each.value.restore_from_file] : []
    content {
      content_length                = restore_from_file.value.content_length
      content_md5                   = restore_from_file.value.content_md5
      restore_key_from_file_details = restore_from_file.value.restore_key_from_file_details
    }
  }

  dynamic "restore_from_object_store" {
    for_each = each.value.restore_from_object_store != null ? [each.value.restore_from_object_store] : []
    content {
      bucket      = restore_from_object_store.value.bucket
      destination = restore_from_object_store.value.destination
      namespace   = restore_from_object_store.value.namespace
      object      = restore_from_object_store.value.object
      uri         = restore_from_object_store.value.uri
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

