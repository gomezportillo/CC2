RG := CC2
owncloud_NAME := ownclouddocker
mysql_NAME 		:= mysqldocker
ldap_NAME			:= ldapdocker

all: owncloud mysql ldap

owncloud:
	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-owncloud \
	                    --name $(owncloud_NAME) \
	                    --image owncloud \
	                    --ports 80


mysql:
	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-mysql \
	                    --name $(mysql_NAME) \
	                    --image pedroma1/docker-mysql \
	                    --ports 3306


ldap:
	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-ldap \
	                    --name $(ldap_NAME) \
	                    --image larrycai/openldap \
	                    --ports 389


connect-to-container:
	az container exec --resource-group $(RG) \
                    --name $(NAME) \
                    --exec-command "/bin/bash"


connect-to-vm:
	ssh azureuser@$(IP)


add-ldap-user:
	ldapadd -H ldap://$(IP) -x -D "cn=admin,dc=openstack,dc=org" -w password -c -f new_user.ldif


search-ldap-users:
	ldapsearch -H ldap://$(IP) -LL -b ou=Users,dc=openstack,dc=org -x
