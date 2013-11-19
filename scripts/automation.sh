#!/bin/bash

#add port 80 to server HTTP pages
#add port 22 to access server via ssh

nova secgroup-add-rule default http 80 80 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0


#below are parameters

Flavor=2
ImageID=f90ffa8a-6abb-453e-a342-45faf34fb231
ServerInstanceName=myserver
SecurityGroup=default
PubKeyName=mypubkey

#generate ssh key and add the public key to the openstack access credentials
#specify Security Group

ssh-keygen -t rsa 
nova keypair-add --pub_key ~/.ssh/id_rsa.pub $PubKeyName
nova keypair-list

Spin up a server based on the above parameters
nova boot --userdata drupal-automation.sh --flavor $Flavor --image $ImageID --key_name $PubKeyName --security_group $SecurityGroup $ServerInstanceName 
