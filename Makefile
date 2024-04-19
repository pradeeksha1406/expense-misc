default:
	git pull
	terraform init -backend-config=sonarqube/state.tfvars
#    terraform apply -auto-approve -var-file=sonarqube/inputs.tfvars
