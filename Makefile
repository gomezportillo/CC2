
all:
	echo "<3"

create_vm:
	sh create_vm.sh $(ARGS)

execute_ansible:
	ansible-playbook -s playbook.yml -i hosts

install-owncloud-docker:
	sh run_command.sh "sudo docker pull owncloud && sudo docker run -d -p 80:80 owncloud --name=owncloud01" $(ARGS)

install-mysql-docker:
	sh run_command.sh "sudo docker pull mysql/mysql-server && sudo docker run --name=mysql01 -d mysql/mysql-server:latest" $(ARGS)

connect-ssh:
	ssh azureuser@${IP}