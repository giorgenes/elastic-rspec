#!/bin/sh

SAMPLES_PATH=$GITPOD_REPO_ROOT/samples
mkdir -p $SAMPLES_PATH
curl https://download.elastic.co/demos/kibana/gettingstarted/shakespeare_6.0.json > $SAMPLES_PATH/shakespeare.json
curl https://download.elastic.co/demos/kibana/gettingstarted/accounts.zip > $SAMPLES_PATH/accounts.zip
curl https://download.elastic.co/demos/kibana/gettingstarted/logs.jsonl.gz > $SAMPLES_PATH/logs.jsonl.gz

cd $SAMPLES_PATH
unzip accounts.zip
gunzip logs.jsonl.gz

