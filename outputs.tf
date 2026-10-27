output "group_members_id" {
  description = "Map of id values across all group_members, keyed the same as var.group_members"
  value       = { for k, v in azuread_group_member.group_members : k => v.id }
}
output "group_members_group_object_id" {
  description = "Map of group_object_id values across all group_members, keyed the same as var.group_members"
  value       = { for k, v in azuread_group_member.group_members : k => v.group_object_id }
}
output "group_members_member_object_id" {
  description = "Map of member_object_id values across all group_members, keyed the same as var.group_members"
  value       = { for k, v in azuread_group_member.group_members : k => v.member_object_id }
}

