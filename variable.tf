variable "db_name" {
    type = string
}

variable "common_tags" {
    type = map(string)
    default = {}
}

variable "ip_range_filter" {
    type = list(string)
}

