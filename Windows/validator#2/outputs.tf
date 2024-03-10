output "On_a_Mac_run_this_first" {
  value = "chmod 400 validator2.pem"
}

output "On_Windows_run_two_command_from_documentation" {
  value = "Review the documentation guide"
}

output "On_both_Mac_and_Windows_run_this_command_adding_your_new_public_IP" {
  value = "ssh -i validator2.pem validatoradmin@<YOUR-PUBLIC-IP>"
}

output "Your_public_IP" {
  value = azurerm_linux_virtual_machine.validator_vm.public_ip_address
}



