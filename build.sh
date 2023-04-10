#!/bin/bash

username="robot_mimi+quanganh"
password="ya56ACR8gNcCF7Gr4ABvZinywzLk7BFq"
repository="harbor.api-connect.io"
project="mimi"

docker logout $repository

pkg_file="./package.json"
# DATE=$(($(date +%s%N)/1000000))
DATE=$(date +%s)

# Extract name from package.json
pkg_name="test_image"

# Print the package name
echo "Package name: $pkg_name"


# Check if logged in to repository
if docker info | grep -q "$repository"; then
  echo "Already logged in to $repository"
else
  # Log in to repository
  echo "Logging in to $repository"
  output=$(echo "$password" | docker login --username $username --password-stdin $repository) 

  if echo $output | grep -q "Login Succeeded"; then
    echo "Người dùng đã đăng nhập vào private repository $repository"

    echo $DATE
    docker build --pull --rm -f "Dockerfile" -t $pkg_name:$DATE "."
    docker tag $pkg_name:$DATE $repository/$project/$pkg_name:$DATE
    docker push $repository/$project/$pkg_name:$DATE
    echo $repository/$project/$pkg_name:$DATE

  else
    echo "Bạn chưa đăng nhập vào private repository $repository"
    exit 1
  fi
fi