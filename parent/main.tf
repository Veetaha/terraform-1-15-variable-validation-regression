variable "parent_variable" {
  type = string
  validation {
    condition     = regexall(".*", var.parent_variable) == tolist([var.parent_variable])
    error_message = "My error message"
  }
}

module "child" {
  source         = "./child"
  child_variable = var.parent_variable
}
