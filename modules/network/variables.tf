variable "cidr_block" {
  type        = string
  description = "Networking CIDR VPC"

}

variable "project_name" {
  type        = string
  description = "Project Name to be uyser to name the resources (Name tags)"

}

variable "tags" {
  type        = map(any)
  description = "Tags do be added to AWS resources"

}