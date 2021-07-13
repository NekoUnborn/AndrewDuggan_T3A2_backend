#!/bin/bash

sed -i "/# gem 'bcrypt', '~> 3.1.7'/c\gem 'bcrypt', '~> 3.1.7'" Gemfile
bundle update

./addResources.sh user users username email password_digest

rails db:migrate

git add .
git commit -m "Added backend Authentication"
git push origin main
