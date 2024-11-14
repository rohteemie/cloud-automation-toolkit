#!/usr/bin/env bash

curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
sudo tee /usr/share/keyrings/mongodb-server-6.0.gpg > /dev/null


echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | \
sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt update

sudo apt install mongodb-mongosh

mongosh