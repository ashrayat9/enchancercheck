#!/bin/sh

echo "Setting up custom certificate in Docker container..."

# Download the certificate
curl -k https://pse.invisirisk.com/ca > /etc/ssl/certs/pse.pem

# Update the CA certificates
update-ca-certificates

# Configure Git
if command -v git >/dev/null 2>&1; then
    git config --system http.sslCAInfo /etc/ssl/certs/pse.pem
    echo "Git configured to use custom certificate."
fi

# Configure npm
if command -v npm >/dev/null 2>&1; then
    npm config set cafile /etc/ssl/certs/pse.pem
    echo "npm configured to use custom certificate."
fi

# Configure yarn
if command -v yarn >/dev/null 2>&1; then
    yarn config set cafile /etc/ssl/certs/pse.pem
    echo "yarn configured to use custom certificate."
fi

# Configure Python pip
if command -v pip >/dev/null 2>&1; then
    pip config --global set global.cert /etc/ssl/certs/pse.pem
    echo "pip configured to use custom certificate."
fi

# Set environment variables
echo "export SSL_CERT_FILE=/etc/ssl/certs/pse.pem" >> /etc/environment
echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/pse.pem" >> /etc/environment
echo "Environment variables set for custom certificate."

echo "Custom certificate setup in Docker container completed."