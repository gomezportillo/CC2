# Cloud Computing 2

## Práctica 1

1. Crear y configurar 3 MV

```bash
make create-vm NAME=owncloudVM
make install-owncloud-docker VM=owncloudVM

make create-vm NAME=mysqlVM
make install-mysql-docker VM=mysqlVM

make create-vm NAME=ldapVM
make install-ldap-docker VM=ldapVM
```

2. Configurar MySQL

```bash
make connect-ssh IP=$MYSQL_IP
docker logs mysql01 # para ver la contraseña autogenerada
docker exec -it mysql01 mysql -uroot -p # metemos la contraseña de antes, para cambiarla ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword';
```

3. Crear la tabla para Owncloud

```mysql
CREATE DATABASE IF NOT EXISTS owncloud;
GRANT ALL PRIVILEGES ON owncloud.* TO 'root'@'localhost' IDENTIFIED BY 'password';
```

4. Configurar el servidor owncloud con los valores obtenidos

### Bibliografía

* https://www.techrepublic.com/article/how-to-deploy-and-use-a-mysql-docker-container/
* https://doc.owncloud.com/server/admin_manual/configuration/database/linux_database_configuration.html#mysql-mariadb-with-binary-logging-enabled
