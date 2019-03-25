
all:
	echo "<3"

create_vm:
	sh create_vm.sh $(NAME)

execute_ansible:
	ansible-playbook -s playbook.yml -i hosts

install-owncloud-docker:
	sh run_command.sh "sudo docker pull owncloud && sudo docker run -d -p 80:80 owncloud --name=owncloud01" $(ARGS)

install-mysql-docker:
	sh run_command.sh "sudo docker pull mysql/mysql-server && sudo docker run --name=mysql01 -d mysql/mysql-server:latest" $(ARGS)

install-ldap:
	sh run_command.sh "sudo docker pull larrycai/openldap && sudo docker run -d -p 389:389 --name ldap -t larrycai/openldap" $(ARGS)

connect-ssh:
	ssh azureuser@${IP}