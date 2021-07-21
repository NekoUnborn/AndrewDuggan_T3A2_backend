#!/bin/bash

# Validate arguments
if [[ ! $# -eq 1 ]] ; then
    echo 'add lowercase app name as argument'
    echo 'eg. ./new_app.sh bookclub'
    exit 1
fi

echo "Adjust the origins to match the URL of the FrontEnd in ./config/initializers/cors.rb"