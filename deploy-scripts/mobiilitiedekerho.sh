#!/bin/sh
 case $1 in
    start)
       nohup java -jar /home/mobiili/app/jar/mobiilitiedekerho-backend-1.0-SNAPSHOT-jar-with-dependencies.jar > /home/mobiili/app/log/stdout.out 2>&1 &
       echo $! > /home/mobiili/app/log/mobiilitiedekerho.pid
       ;;
     stop)
       kill $(cat /home/mobiili/app/log/mobiilitiedekerho.pid);
       rm /home/mobiili/app/log/mobiilitiedekerho.pid
       ;;
     *)
       echo "usage: mobiilitiedekerho {start|stop}" ;;
 esac
 exit 0
 
