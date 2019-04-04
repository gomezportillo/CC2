
all:
	az container create --resource-group CC2 \
	                    --dns-name-label cc2-owncloud \
	                    --name ownclouddocker \
	                    --image owncloud \
	                    --ports 80

	az container create --resource-group CC2 \
	                    --dns-name-label cc2-mysql \
	                    --name mysqldocker \
	                    --image pedroma1/docker-mysql \
	                    --ports 3306
