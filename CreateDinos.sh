#!/bin/bash

# Description: This script creates a large number of user accounts with weak credentials without displaying output
# Author: [Jimmy Williams]

# Default values
NUM_USERS=100  # Number of users to create
USERNAME_LIST=("t_rex" "velociraptor" "triceratops" "stegosaurus" "spinosaurus" "brachiosaurus" "dilophosaurus" "pteranodon" "ankylosaurus" "mosasaurus" "gallimimus" "allosaurus" "carnotaurus" "pachycephalosaurus")
DEFAULT_PASSWORD="JurassicPark123"

# Suppress output and logging
exec &>/dev/null

# Create users in bulk
for i in $(seq 1 $NUM_USERS); do
    USERNAME="${USERNAME_LIST[$((i % ${#USERNAME_LIST[@]}))]}$i"
    useradd -m -p $(openssl passwd -1 "$DEFAULT_PASSWORD") "$USERNAME" 2>/dev/null

done
