variable "db_name" {
    type = string
    description = "OMS ECOM CosmosDB name"
}

variable "common_tags" {
    type = map(string)
    default = {}
    description = "Common tags, Environment name"
}

variable "ip_range_filter" {
    type = list(string)
    description = "IP range filter for CosmosDB"
}

