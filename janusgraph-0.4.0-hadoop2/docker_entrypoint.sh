#!/usr/bin/env bash

if [ -z "$JANUSGRAPHPORT" ]
then
    JANUSGRAPHPORT=8182
fi

if [ -z "$GREMLINTHREADS" ]
then
    GREMLINTHREADS=1
fi

if [ -z "$GREMLINPOOL" ]
then
    GREMLINPOOL=1
fi

if [ -z "$CGFGRAPHNAME" ] 
then
    CGFGRAPHNAME=configured_graph_factory_table
fi

if [ -z "$CASSANDRAPASSWORD" ] 
then
    CASSANDRAPASSWORD=cassandra
fi

if [ -z "$CASSANDRAUSERNAME" ] 
then
    CASSANDRAUSERNAME=cassandra
fi

if [ -z "$CQLKEYSPACE" ] 
then
    CQLKEYSPACE=janusgraph
fi

if [ -x "$ADDITIONAL_JAVA_OPTS" ]
then
    ADDITIONAL_JAVA_OPTS=-Xms32m -Xmx512m
fi

echo `pwd`

sed "s/JANUSGRAPHPORT/$JANUSGRAPHPORT/g; s/GREMLINTHREADS/$GREMLINTHREADS/g; s/GREMLINPOOL/$GREMLINPOOL/g" conf/gremlin-server/gremlin-server.yaml.template > conf/gremlin-server/gremlin-server.yaml
sed "s/CGFGRAPHNAME/$CGFGRAPHNAME/g; s/CASSANDRAPASSWORD/$CASSANDRAPASSWORD/g; s/CASSANDRAUSERNAME/$CASSANDRAUSERNAME/g; s/CQLKEYSPACE/$CQLKEYSPACE/g" conf/gremlin-server/janusgraph-cql-es-server.custom.template > conf/gremlin-server/janusgraph-cql-es-server.properties

./bin/gremlin-server.sh 

exit 1
