#!/bin/sh
cd backend
mvn package
scp -i ~/.ssh/id_rsa_mbtiedekerho target/mobiilitiedekerho-backend-1.0-SNAPSHOT-jar-with-dependencies.jar mobiili@mobiilitiedekerho:/home/mobiili/app/jar/
ssh -i ~/.ssh/id_rsa_mbtiedekerho mobiili@mobiilitiedekerho '/home/mobiili/app/mobiilitiedekerho.sh stop; /home/mobiili/app/mobiilitiedekerho.sh start'
