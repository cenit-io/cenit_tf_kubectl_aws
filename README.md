## Infraestructura del proyecto Cenit
Congifuración AWS
* en el fichero .env se tiene que poner las variables de entorno para la conexion con AWS para el despliegue:
    * export AWS_ACCESS_KEY_ID=
    - export AWS_SECRET_ACCESS_KEY=
    - export AWS_DEFAULT_REGION=


---
# AWS
El deploy de kubernete depende de la version v1.19, en AWS

# Makefile
* Se auto gestiona la conexión a los modulos de terraform mediante el make, en este paso esta dadas las funciones:
    * cluster: < Genera un cluster en aws, por default v1.19 >
    - deploy:  < Deploy del proyecto kubernete en el cluster >  
    - destroy: < Destruye todas las instancias de los modulos terraform >

# Terraform
con terraform se crean 2 proyectos, 
- 1- Cluster en Kubernete
- 2- Deploy de kubernete
