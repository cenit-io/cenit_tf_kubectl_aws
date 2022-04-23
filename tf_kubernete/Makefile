
# Activar el sources del accesso a la API de AWS
auth:
	bash -c "source .env"

# terraform Init
# Primero hacemos init y luego aplicamos
init: auth 
	terraform  init	

# Terraform plan
plan: init 
	terraform  plan	

# Terraform apply
apply: plan
	terraform  apply --auto-approve

# Terraform destroy
destroy:
	terraform  destroy --auto-approve
