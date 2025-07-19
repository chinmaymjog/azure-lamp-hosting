#!/bin/bash
set -e

# Start the Jenkins service
echo "Starting Jenkins service..."
service jenkins start

# Keep the container running
exec tail -f /var/log/jenkins/jenkins.log
