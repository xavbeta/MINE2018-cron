#!/bin/bash

#set environmental variables for cron environment
printenv | grep SERVER_PORT_* >> /etc/environment 

# Run cron deamon
cron && tail -f /var/log/cron.log