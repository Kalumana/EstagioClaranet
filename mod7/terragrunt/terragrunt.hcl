remote_state {
    backend "azurerm"{
        config ={
            resource_group_name = "Estagio-AK"
            storage_account_name ="tftreinamento3k5"
            container_name = "terraform"
            key = "6jblmRVHVuJfHLdd5gdfVYw5bFy5fAHSnsad7tf2hjo0CZ2Q79+CL6W83j8XElLEMgzTFm3cIErnSAHkIypfMA=="
        
        }
    }
}

input = {
    location = "northeurope" 
    rg = "Estagio-AK"
}