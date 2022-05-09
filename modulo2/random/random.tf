terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.2"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
    length = 10 
    special = true 

}