#! /usr/bin/bash

# Get the IDs of existing db clusters (we know there's only 1 for now)
db_cluster_id=$(doctl databases list --format ID --no-header)

# Get the cluster Host name
db_cluster_host=$(doctl databases connection ${db_cluster_id} --format Host --no-header)

# Get the cluster password
db_cluster_password=$(doctl databases connection ${db_cluster_id} --format Password --no-header)

echo "postgresql://doadmin:${db_cluster_password}@private-${db_cluster_host}:25060/app?sslmode=require"
echo "postgresql://doadmin:${db_cluster_password}@private-${db_cluster_host}:25060/keto?sslmode=require"
echo "postgresql://doadmin:${db_cluster_password}@private-${db_cluster_host}:25060/kratos?sslmode=require"
