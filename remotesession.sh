#!/bin/bash

source .config
  
doctl auth switch --context auto-startup-shutdown-command

echo "> Starging droplet $DROPLET_ID"
doctl compute droplet-action power-on $DROPLET_ID > /dev/null

while :
do
    sleep 5
    doctl compute droplet list | grep $DROPLET_ID | grep active
    if [ $? -eq 0 ]; then 
        echo "> droplet active"
        break; 
    else
        echo "> droplet not active"
    fi
done

echo "> starting session"
ssh $DROPLET_IP
echo "> session over. stopping droplet $DROPLET_ID"
doctl compute droplet-action power-off $DROPLET_ID > /dev/null

while :
do
    sleep 5
    doctl compute droplet list | grep $DROPLET_ID | grep off
    if [ $? -eq 0 ]; then 
        echo "> droplet not active"
        break; 
    else
        echo "> droplet active"
    fi
done

echo "> done"
