#!/bin/sh
# startup zookeeper and kafka by supervisord
/usr/share/zookeeper/bin/zkServer.sh start-foreground &
$KAFKA_HOME/bin/start-kafka.sh &

# Create topic iot-devices-topic
echo "sleep 30 seconds, wait for zookeeper and kafka startup"
/bin/sleep 30
echo "generate iot-devices-topic"
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic iot-devices-topic
