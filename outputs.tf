output "First_run_this_command on Mac" {
  value = "chmod 400 validator.pem"
}

output "First_run_the_two commands documented for Windows" {
  value = "Icacls validator.pem /Inheritance:r and review the documentation guide for the second command"
}

output "Next_run_this_command_adding_your_new_public_IP" {
  value = "ssh -i validator.pem validatoradmin@<YOUR-PUBLIC-IP>"
}

output "Your_public_IP" {
  value = azurerm_linux_virtual_machine.validator_vm.public_ip_address
}


