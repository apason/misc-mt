# misc-mt

This repository contains all the SQL- and shell-scripts used with the back-end server.  
As well as sample S3 policy files and a sample ngnix config files.

##SQL-directory#
- Contains SQL-scripts to start the database and create a user to it (or clear the database or the user)
- A script for creating the tables automatically 
- As well as test-instances for it.

##deploy-scripts -directory##
- mobiilitiedekerho.sh to start/stop the server
- deploy_to_production.sh can be used to upload new version of the back-end to the server (can be easily done too "manually")

##S3_policies -directory##
- A sample bucket policy
- A sample CORS configuration
- Only sample-ones, to be used as a base for "real ones"

##nginx-config -directory##
- Contains a sample ngnix config file
