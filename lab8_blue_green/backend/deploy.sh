#! /bin/bash
set -xe

CURRENT_CONTAINER=$(docker ps --filter 'name=backend' --format '{{.Names}}' | grep -E 'backend-(blue|green)' | head -n 1)
if [[ $CURRENT_CONTAINER == *blue* ]]; then
        docker-compose up backend-green -d --pull always --force-recreate

        while [[ $(docker inspect --format='{{.State.Health.Status}}' sausage-store-backend-green) != 'healthy' ]]; do
            echo 'Waiting for backend-green to become healthy...'
            sleep 5
        done

        sleep 5
        docker rm -f sausage-store-backend-blue
else
        docker-compose up backend-blue -d --pull always --force-recreate

        while [[ $(docker inspect --format='{{.State.Health.Status}}' sausage-store-backend-blue) != 'healthy' ]]; do
            echo 'Waiting for backend-blue to become healthy...'
            sleep 5
        done

        sleep 5
        docker rm -f sausage-store-backend-green
fi

docker ps

