#!/bin/bash
# Description: Script for alpine container
# Maintainer: Peter
#

# Default values of arguments
IMAGE=linuxcontainers/alpine:test
CONTAINER=alpine-test
LC_ALL=en_GB.UTF-8
TIMEZONE=GMT

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -c=*|--container=*)
        CONTAINER="${arg#*=}"
        shift # Remove
        ;;
        -l=*|--lc_all=*)
        LC_ALL="${arg#*=}"
        shift # Remove
        ;;
        -t=*|--timezone=*)
        TIMEZONE="${arg#*=}"
        shift # Remove
        ;;
        -h|--help)
        echo -e "usage "
        echo -e "$0 "
		echo -e "  -c=|--container=${CONTAINER} -> name of container"
        echo -e "  -l=|--lc_all=${LC_ALL} -> locale"
        echo -e "  -t=|--timezone=${TIMEZONE} -> timezone"
		exit 0
        ;;
    esac
done

echo "# Image               : ${IMAGE}"
echo "# Container Name      : ${CONTAINER}"
echo "# Locale              : ${LC_ALL}"
echo "# Timezone            : ${TIMEZONE}"

echo -e "Check if container ${CONTAINER} exist"
CHECK=$(docker container ps -a | grep ${CONTAINER} | wc -l)
if [ ${CHECK} == 1 ]; then
    echo -e "Stop Container -> ${CONTAINER}"
    docker stop ${CONTAINER} > /dev/null

    echo -e "Remove Container -> ${CONTAINER}"
    docker container rm ${CONTAINER} > /dev/null
else 
    echo -e "The container ${CONTAINER} not exist"
fi

echo -e "Create and run container"
docker run -dit --name ${CONTAINER} -e LC_ALL=${LC_ALL} -e TIMEZONE=${TIMEZONE} ${IMAGE}

echo -e "Sleep 5 second"
sleep 5

IP=$(docker exec -it ${CONTAINER} /sbin/ip route | grep "src" | awk '{print $7}')
echo -e "IP Address is: $IP";

echo -e ""
echo -e "Environment variable";
docker exec -it ${CONTAINER} env

echo -e ""
echo -e "Test Locale (date)";
docker exec -it ${CONTAINER} date

echo -e ""
echo -e "Container Logs"
docker logs ${CONTAINER}
