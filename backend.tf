terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
//  backend "azurerm" {
//    storage_account_name = "<storage-acc-name>"
//    container_name= "<container-name>"
//    key="<tfstate-file-name>.tfstate"
//    access_key="<storage-acc-access-key>"
//  }
}