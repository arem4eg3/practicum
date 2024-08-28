#!/bin/bash
set -xe

# copy service file from home dir to systemd dir
sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service

# add Env to backend service file
sudo sed -i -e "s/PSQL_USER=/PSQL_USER=$PSQL_USER/g" \
    -e "s/PSQL_PASSWORD=/PSQL_PASSWORD=$PSQL_PASSWORD/g" \
    -e "s/PSQL_HOST=/PSQL_HOST=$PSQL_HOST/g" \
    -e "s/PSQL_DBNAME=/PSQL_DBNAME=$PSQL_DBNAME/g" /etc/systemd/system/sausage-store-backend.service

sudo sed -i -e "s/MONGO_USER=/MONGO_USER=$MONGO_USER/g" \
    -e "s/MONGO_PASSWORD=/MONGO_PASSWORD=$MONGO_PASSWORD/g" \
    -e "s/MONGO_HOST=/MONGO_HOST=$MONGO_HOST/g" \
    -e "s/MONGO_DATABASE=/MONGO_DATABASE=$MONGO_DATABASE/g" /etc/systemd/system/sausage-store-backend.service

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
