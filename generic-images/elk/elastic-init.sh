#!/bin/bash

wait-for-service localhost 9200

sleep 1

curl -XPUT 'localhost:9200/_settings' -d '
{
    "index" : {
        "number_of_replicas" : 0
    }
}'
curl -XPUT localhost:9200/_template/template_1 -d '
{
    "template" : "*",
    "settings" : {
        "number_of_replicas" : 0
    }
}'
