terraform {
  backend "azurerm" {
    storage_account_name = "rockykgf9000908"
    container_name       = "rocky"
    key                  = "prod.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "nvl6f1AOJBMqRK9TKa0GD0CwoWmouReQYHCElWU2VFN6ZWn16V5LA7PosXJ/U6NRef0FUBysQZz3+AStVxY8EQ=="
  }
}