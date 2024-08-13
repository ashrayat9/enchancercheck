#!/bin/sh
echo "Running entrypoint"
chmod +x /app/entrypoints/setup.sh
chmod +x /app/entrypoints/certificate.sh
chmod +x /app/entrypoints/start.sh
chmod +x /app/entrypoints/end.sh
chmod +x /app/build.sh

sh -c /app/entrypoints/setup.sh
sh -c /app/entrypoints/certificate.sh
sh -c /app/entrypoints/start.sh

sh -c /app/build.sh

sh -c /app/entrypoints/end.sh


# Execute the command passed to the script
echo "Executing command: $@"
exec $@