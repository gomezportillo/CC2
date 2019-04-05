RG := CC2
owncloud_NAME := ownclouddocker
mysql_NAME 		:= mysqldocker
ldap_NAME			:= ldapVM

all:
	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-owncloud \
	                    --name $(owncloud_NAME) \
	                    --image owncloud \
	                    --ports 80

	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-mysql \
	                    --name $(mysql_NAME) \
	                    --image pedroma1/docker-mysql \
	                    --ports 3306

	sh create_vm.sh $(ldap_NAME)
	sh run_command.sh "sudo docker pull larrycai/openldap && \
	sudo docker run -d -p 389:389 --name ldap -t larrycai/openldap && \
	sudo apt-get install ldap-utils" $(ldap_NAME)



connect-to-container:
	az container exec --resource-group $(RG) \
                    --name $(NAME) \
                    --exec-command "/bin/bash"

connect-to-vm:
	ssh azureuser@${IP}
