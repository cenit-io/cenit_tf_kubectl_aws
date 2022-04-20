# variables
path_terraform = ./aws_cluster_kubernete/

# Creamos el cluster de kubernetes en AWS
cluster:    
	bash -c "cd $(path_terraform) && make apply"


# Desplegamos el proyecto Kubernetes dentro del Cluster en AWS
deploy:    
	echo "Deploy"

# terraform destroy
end:    
	bash -c "cd $(path_terraform) && make destroy"
