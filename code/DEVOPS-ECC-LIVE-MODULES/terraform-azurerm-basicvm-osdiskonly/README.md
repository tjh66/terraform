# Introduction 
Builds a standard windows VM with default size Standard_B2ms with 128Gb OS Disk Only

When Deploying a Market Place image
Ensure the Availabilty set is Managed this is by default when deployed using the ECC module
Ensure the below is populated with the correct values<br>
**publisher**<br>
**offer**<br>
**sku**<br>
**version**<br>
Information on the available SKUs use powershell
az vm image list --offer {Offer Name} --all --output table

After Domin Join Encrypt Disks add to correct OU run SCCM client if required and add the computer to the correct AD Group see [WiKI](https://dev.azure.com/Essex-County-Council/Production%20Terraform%20Modules/_wiki/wikis/Production-Terraform-Modules.wiki/9/Terraform-Modules)