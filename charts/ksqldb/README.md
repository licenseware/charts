# ksqlDB

## Bring your own Kafka

To specify another Kafka as a broker, simply pass the following content to
your installation:

```yaml
kafka:
  create: false
configMapPairs:
  KSQL_BOOTSTRAP_SERVERS: kafka:9092
```
