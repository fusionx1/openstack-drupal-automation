openstack-drupal-automation
===========================

drupal automation using openstack

This project aims to provide a proof of concept that drupal can be automated using openstack as enterprise solution

Heres a scenario 1:

A drupal application is running on a server with lamp stack and a jenkin server is running in a background monitoring 
its server utilization. Once the server is > 90% utilized for an interval, 2 servers(1 load balancer and another lamp stack server) 
will be provisioned via nova api in a console. Now there will be two webservers and a load balancer thats enough to handle traffic

Once the server utilization subsided jenkin server with a log monitoring script running in an interval will trigger a nova command via 
console to destroy the servers and return to its original state.


Requirements
The image snapshot must have a running lamp and drush

Below are the parameters that needs to be set:

1. Flavor=2
2. ImageID=f90ffa8a-6abb-453e-a342-45faf34fb231
3. ServerInstanceName=myserver
4. SecurityGroup=default
5. PubKeyName=mypubkey


Future Features

1. Be able to assign a public ip to the provisined server automatically
2. Will test haproxy for load balancer
3. Will add documentation


