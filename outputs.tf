output "First_run_this_command" {
  value = "chmod 400 validator.pem"
}

output "Next_run_this_command_adding_your_new_public_IP" {
  value = "ssh -i validator.pem validatoradmin@<YOUR-PUBLIC-IP>"
}

output "Your_public_IP" {
  value = azurerm_linux_virtual_machine.validator_vm.public_ip_address
}


