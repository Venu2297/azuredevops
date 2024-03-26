resource "azurerm_network_interface" "Nic" {
    name= var.nic-name1
    location = azurerm_resource_group.RG.location
    resource_group_name = azurerm_resource_group.RG.name
    depends_on = [ azurerm_public_ip.PIP ]

    ip_configuration{
        name =  "ipconfig"
        subnet_id = azurerm_subnet.Snet[0].id
    private_ip_address_allocation = var.pipall-name
    public_ip_address_id = azurerm_public_ip.PIP[0].id

    }  
    
}
resource "azurerm_network_interface" "Nic-02" {
    name= var.nic-name2
    location = azurerm_resource_group.RG.location
    resource_group_name = azurerm_resource_group.RG.name
   
depends_on = [ azurerm_network_interface.Nic ]
    ip_configuration{
        name =  "ipconfig"
        subnet_id = azurerm_subnet.Snet[1].id
    private_ip_address_allocation = var.pipall-name
    public_ip_address_id = azurerm_public_ip.PIP[1].id

    }  
}


resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
    subnet_id = azurerm_subnet.Snet[0].id
    network_security_group_id = azurerm_network_security_group.NSG.id
    }
    resource "azurerm_subnet_network_security_group_association" "nsgassociation2" {
    subnet_id = azurerm_subnet.Snet[1].id
    network_security_group_id = azurerm_network_security_group.NSG.id
    depends_on = [ azurerm_subnet_network_security_group_association.nsgassociation ]
    }




