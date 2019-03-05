COMMAND=$1
VM_NAME=$2
RES_GROUP=CC2

echo $1
echo $2

az vm run-command invoke \
    --resource-group $RES_GROUP \
    --name $VM_NAME \
    --command-id RunShellScript \
    --scripts "$COMMAND"