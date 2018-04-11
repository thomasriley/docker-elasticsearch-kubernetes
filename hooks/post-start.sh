#!/bin/bash

# Block the container until it has started and the cluster is green

node_ip=$(getent hosts elasticsearch-master-2 | awk '{ print $1 }')

until curl --silent http://$(hostname):9200/_cat/nodes | grep -q $node_ip;
do
  echo "Container is not in the cluster yet"
done

until curl --silent http://$(hostname):9200/_cat/health | grep -q green;
do
  echo "Cluster is not green yet"
done
