#! /bin/bash

echo "Extracting tar files"
echo 

mkdir camunda-engine
tar -xzf ./camunda-bpm-tomcat-7.11.0.tar.gz -C camunda-engine 
tar -xzf ./camunda-modeler-3.1.0-linux-x64.tar.gz 
mv ./camunda-modeler-3.1.0-linux-x64 ./camunda-modeler 

echo
echo "Removing Demo Files"
echo

sudo rm -r ./camunda-engine/server/apache-tomcat-9.0.19/webapps/camunda-invoice/

echo 
echo "Downloading Plugins"
echo 

git clone https://github.com/bpmn-io/bpmn-js-token-simulation-plugin.git ./camunda-modeler/resources/plugins/token-sim/ 

git clone https://github.com/camunda/camunda-cockpit-plugins.git

mv ./camunda-cockpit-plugins/cockpit-plugin-rest-client/src/main/resources/plugin-webapp/rest-client ./camunda-engine/server/apache-tomcat-9.0.19/webapps/camunda/plugin/

cd camunda-cockpit-plugins/cockpit-plugin-rest-client
mvn clean install 
cp target/cockpit-plugin-rest-client.jar ../../camunda-engine/server/apache-tomcat-9.0.19/webapps/camunda/WEB-INF/lib
cd ../..

sudo rm -r camunda-cockpit-plugins

echo
echo "Installing element templates"
echo

cp -r ./element-templates ./camunda-modeler/resources/

echo 
echo "Done"

