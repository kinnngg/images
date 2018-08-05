#!/bin/bash
sleep 2

cd /home/container

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "${MODIFIED_STARTUP}"

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

# Run the Server
${MODIFIED_STARTUP}
