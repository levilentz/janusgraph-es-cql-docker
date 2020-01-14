FROM centos

RUN yum -y update
RUN yum -y install java-1.8.0-openjdk

RUN mkdir /app

COPY janusgraph-0.4.0-hadoop2 /app

WORKDIR /app

CMD ["bash", "docker_entrypoint.sh"]

