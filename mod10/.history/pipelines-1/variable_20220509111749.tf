variable "location" {
  type = string
  default = "northeurope"
}

variable "tags" {
  type = map
  default ={
      "owner" = "António Kalumana"
      "ambiente" = "Kalu"
  }
}
