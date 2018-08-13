FROM debian:jessie-backports

FROM ibmjava:jre

ENV KAFKA_HOME=/opt/kafka

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY source-code/core/build/distributions/kafka_2.11-2.1.0-SNAPSHOT.tgz start-kafka.sh broker-list.sh create-topics.sh /tmp/

RUN mkdir /opt/overrides && chmod a+x /tmp/*.sh \
 && mv /tmp/start-kafka.sh /tmp/broker-list.sh /tmp/create-topics.sh /usr/bin \
 && tar xfz /tmp/kafka_2.11-2.1.0-SNAPSHOT.tgz -C /opt \
 && ln -s /opt/kafka_2.11-2.1.0-SNAPSHOT /opt/kafka \
 && chmod a+x /opt/kafka/bin/*.sh \
 && rm /tmp/*

COPY overrides /opt/overrides

VOLUME ["/kafka"]

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["start-kafka.sh"]


RUN useradd -u 1000 -g 1000 -ms /bin/bash jenkins
