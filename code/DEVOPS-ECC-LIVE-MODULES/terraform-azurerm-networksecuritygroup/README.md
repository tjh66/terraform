# Introduction 
 Creates a default NSG and attaches it to an existing subnet when adding rules use a seperate script with the azurerm_network_security_rule block to add / update or remove rules<br><br>

 This will deploy the NSG with Standard Outbound Rules 6500, 65001 & 65002 <br>
 This will deploy the NSG with Standard Inbound Rules 6500, 65001 & 65002 <br>