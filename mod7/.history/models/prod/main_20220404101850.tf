module "prod" {
  source = "../infra"

  ambiente = "prod"
  location = "northeurope"
}