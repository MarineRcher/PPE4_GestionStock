#!/bin/sh
echo "Waiting for MySQL to start..."
while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done
echo "MySQL started."

echo "Executing SQL script..."
mysql -u root -proot < /docker-entrypoint-initdb.d/GSB.sql
echo "Script executed."