#!/bin/bash
set -xe

# copy service file from home dir to systemd dir
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service 

# delete old tgz in home dir
sudo rm -rf /home/${DEV_USER}/sausage-store.tar.gz

# download frontend tgz from Nexus
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.tar.gz ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_FRONTEND_NAME}/${VERSION}/sausage-store-${VERSION}.tar.gz

# delete old tgz files from work dir
sudo rm -rf /opt/sausage-store/static/dist/frontend/

# copy new frontend folder in work dir
sudo tar xvf sausage-store.tar.gz -C /opt/sausage-store/static/dist/

# reload systemd and restar service
sudo systemctl daemon-reload
sudo systemctl enable sausage-store-frontend
sudo systemctl restart sausage-store-frontend
