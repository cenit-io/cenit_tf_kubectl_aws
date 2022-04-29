# variables
path_terraform = ./aws_cluster_kubernete/
path_kubernete = ./tf_kubernete/

# Creamos el cluster de kubernetes en AWS
cluster:    
	bash -c "cd $(path_terraform) && make apply"


# Desplegamos el proyecto Kubernetes dentro del Cluster en AWS
deploy:    
	bash -c "cd $(path_kubernete) && make apply"

all: cluster deploy
	echo "LIsto el despliegue"


# terraform destroy
destroy:  
	bash -c "cd $(path_kubernete) && make destroy"  
	bash -c "cd $(path_terraform) && make destroy"

