RG := CC2

all:
	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-owncloud \
	                    --name ownclouddocker \
	                    --image owncloud \
	                    --ports 80

	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-mysql \
	                    --name mysqldocker \
	                    --image pedroma1/docker-mysql \
	                    --ports 3306

	az container create --resource-group $(RG) \
	                    --dns-name-label cc2-ldap \
	                    --name ldapdocker \
	                    --image osixia/openldap \
	                    --ports 389 636

connect-to-container:
	az container exec --resource-group $(RG) \
                  --name $(NAME) \
                  --exec-command "/bin/bash"
