#!/bin/bash

# This script will be triggered by the end of OS Provisioning of the Openstack 
# regardless it runs via compute nova using Web Gui or via Console
# This script requires Drush.


# Get the scripts root directory.
SCRIPTSDIR=$(pwd)

# Initialize constants.
DBNAME="drupal"
DBPASS=""
DBUSER="root"
DRUPALADMINEMAIL="admin@webapp.org"
DRUPALUSERNAME="admin"
DRUPALPASSWORD="password"
DRUPALSITENAME="Drupal"
DRUPALVERSION="drupal-7.x"
SITEEMAIL="admin@webapp.org"
DOCROOT="/var/www"
PROFILE="standard"
DBPORT="3306"
PROJECT="webapp"

# Create the empty database name for Drupal.
mysqladmin -u$DBUSER -p$DBPASS create $DBNAME

# Navigate to the public directory.
cd $DOCROOT

# Get the Drupal package.
drush dl $DRUPALVERSION

# Rename the directory.
DRUPALDIR="drupal-7.x-dev"
mv $DRUPALDIR/* $DOCROOT/$PROJECT
rm -rf $DOCROOT/$DRUPALDIR

# Run the installer.
drush site-install -y $PROFILE --db-url=mysql://$DBUSER:$DBPASS@localhost:$DBPORT/$DBNAME --account-mail=$DRUPALADMINEMAIL --account-name=$DRUPALUSERNAME --account-pass=$DRUPALPASSWORD --site-name=$DRUPALSITENAME --site-mail=$SITEEMAIL

