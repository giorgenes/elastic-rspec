#!/bin/sh


curl -H 'Content-Type: application/x-ndjson' -X POST 'http://localhost:9200/shakespeare/_bulk?pretty' --data-binary @samples/shakespeare.json > import.log
curl -H 'Content-Type: application/x-ndjson' -X POST 'http://localhost:9200/accounts/_bulk?pretty' --data-binary @samples/accounts.json >> import.log
curl -H 'Content-Type: application/x-ndjson' -X POST 'http://localhost:9200/logs/_bulk?pretty' --data-binary @samples/logs.jsonl >> import.log

