#!/bin/bash

wait-for-service localhost 9200

sleep 1

curl -XPUT 'localhost:9200/_settings' -d '
{
    "index" : {
        "number_of_replicas" : 0
    }
}'
