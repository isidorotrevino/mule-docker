FROM java:openjdk-8-jdk

MAINTAINER isidoro.trevino@vintec.mx

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz && echo "6814d3dffb5d8f308101ebb3f4e3224a mule-standalone-3.7.0.tar.gz" | md5sum -c

RUN cd /opt && tar xvzf ~/mule-standalone-3.7.0.tar.gz && rm ~/mule-standalone-3.7.0.tar.gz && ln -s /opt/mule-standalone-3.7.0 /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081

