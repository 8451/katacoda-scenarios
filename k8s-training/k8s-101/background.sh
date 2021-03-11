#!/bin/bash

sudo grep -i "done" /opt/katacoda-background-finished &> /dev/null
if [[ "$?" -eq 0 ]]; then
exit
fi

# give time for assets to be staged
sleep 5 
#while true; do sudo grep -i "done" /opt/katacoda-finished > /dev/null && break || sleep 2; done

/usr/local/bin/deploy.sh

echo "done" | sudo tee /root/katacoda-background-finished
