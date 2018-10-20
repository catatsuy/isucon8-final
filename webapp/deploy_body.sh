#!/bin/bash -x

echo "start deploy ${USER}"
for server in g1-11 g2-11 g3-11 g4-11; do
    ssh -t $server "sudo systemctl stop isucoin"
    rsync -av ./go/src $server:/home/isucon/isucon2018-final/webapp/go/src/
    ssh -t $server "sudo systemctl start isucoin"
done

echo "finish deploy ${USER}"
