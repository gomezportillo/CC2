#!/bin/bash

RES_GROUP=CC2
VM_NAME=$1
NS_GROUP=ldapNSG

az_output=$(az vm create \
    --resource-group $RES_GROUP \
    --name $VM_NAME \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --storage-sku Standard_LRS \
    --custom-data setup_docker.sh)

IP=$(echo $az_output | jq -r '.publicIpAddress')
echo "IP de la VM $1: $IP"

 az network nsg rule create \
    --resource-group $RES_GROUP \
    --nsg-name $NS_GROUP \
    --name HTTP_rule \
    --protocol tcp \
    --priority 300 \
    --destination-port-range 80 \
    --access allow >/dev/null