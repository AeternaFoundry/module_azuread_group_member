variable "group_members" {
  description = <<EOT
Map of group_members, attributes below
Required:
    - group_object_id
    - member_object_id
EOT

  type = map(object({
    group_object_id  = string
    member_object_id = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.group_members : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.group_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.group_members : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.member_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
}

