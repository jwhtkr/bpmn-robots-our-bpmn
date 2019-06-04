#! /bin/bash

echo "Extracting tar files."

mkdir camunda-engine
tar -xzf ./camunda-bpm-tomcat-7.11.0.tar.gz -C camunda-engine > /dev/null
tar -xzf ./camunda-modeler-3.1.0-linux-x64.tar.gz > /dev/null
mv ./camunda-modeler-3.1.0-linux-x64 ./camunda-modeler > /dev/null

echo "Done"

