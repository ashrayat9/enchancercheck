#!/bin/sh
echo "Running entrypoint"
chmod +x /app/entrypoints/setup.sh
chmod +x /app/entrypoints/certificate.sh
chmod +x /app/entrypoints/start.sh
chmod +x /app/entrypoints/end.sh
chmod +x /app/build.sh

TECHNOLOGY=javascript
NODE_VERSION=18.20.4
HOSTNAME=3d45ef4f2d9f
YARN_VERSION=1.22.19
SHLVL=1
HOME=/root
VERSION=18
TERM=xterm
SERVICE_NAME=build-service-1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
BUILD_ID=bd1ac2d5-c4c4-40e8-8e0f-0add5cc2630d
MANIFEST_FILE=package.json
PWD=/app

sh -c /app/entrypoints/setup.sh
sh -c /app/entrypoints/certificate.sh
sh -c /app/entrypoints/start.sh

sh -c /app/build.sh

sh -c /app/entrypoints/end.sh


# Execute the command passed to the script
echo "Executing command: $@"
exec $@