#!/bin/bash
set -xe

# copy service file from home dir to systemd dir
sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service 

# delete old jar in home dir
sudo rm -rf /home/${DEV_USER}/sausage-store.jar

# download jar from Nexus
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.jar ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_BACKEND_NAME}/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar

# delete old jar file from work dir
sudo rm -rf /opt/sausage-store/static/bin/*.jar

# copy new jar in work dir
sudo cp -rf sausage-store.jar /opt/sausage-store/static/bin/.

# reload systemd and restar service
sudo systemctl daemon-reload
sudo systemctl enable sausage-store-backend
sudo systemctl restart sausage-store-backend
