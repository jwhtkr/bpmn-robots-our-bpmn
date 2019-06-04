#! /bin/bash

echo "Extracting tar files"
echo 

mkdir camunda-engine
tar -xzf ./camunda-bpm-tomcat-7.11.0.tar.gz -C camunda-engine 
tar -xzf ./camunda-modeler-3.1.0-linux-x64.tar.gz 
mv ./camunda-modeler-3.1.0-linux-x64 ./camunda-modeler 

echo 
echo "Downloading Plugins"
echo 

git clone https://github.com/bpmn-io/bpmn-js-token-simulation-plugin.git ./camunda-modeler/resources/plugins/token-sim/ 

echo
echo "Installing element templates"
echo

cp -r ./element-templates ./camunda-modeler/resources/

echo 
echo "Done"

