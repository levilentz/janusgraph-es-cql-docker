# janusgraph-es-cql-docker

This repository is used for local testing and development of janusgraph. Specifically, this repo contains a modified janusgraph repo, with a custom docker-entrypoint.sh with optimized gremlin-server.yaml, and gremlin-server.sh. 

Environmental variables for this docker container (name=default):
* JANUSGRAPHPORT=8182
* GREMLINTHREADS=1
* GREMLINPOOL=1
* CGFGRAPHNAME=configured_graph_factory_table
* CASSANDRAPASSWORD=cassandra
* CASSANDRAUSERNAME=cassandra
* CQLKEYSPACE=janusgraph
* ADDITIONAL_JAVA_OPTS=-Xms32m -Xmx512m

To use this image, create the following volumes:
* elasticsearch
* cassandra 
