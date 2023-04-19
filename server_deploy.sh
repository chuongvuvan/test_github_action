#!/bin/bash
set -e

echo "🚀 Deploying application ..."

# Enter maintanance mode
php artisan down
    # Update codebase
    git pull origin master

    # Set permission
    echo "🚀 Set permission ..."
    rm -rf composer.lock
    sudo chmod -R 777 storage
    sudo chmod -R 777 bootstrap/cache

    # Install dependencies based on lock file
    echo "🚀 Install dependencies based on lock file ..."
    rm -rf .env
    cp .env.example .env
    composer install --ignore-platform-reqs

    # Migrate database
    echo "🚀 Migrate database ..."
    php artisan key:generate
    php artisan storage:link

#    # FRONTEND BUILD
#    echo "🚀 FRONTEND BUILD ..."
#    npm install
#    npm run prod

    # CACHE ASSETS
    echo "🚀 CACHE ASSETS ..."
    php artisan config:cache
    php artisan cache:clear
    php artisan route:cache
    php artisan view:cache
    php artisan optimize:clear
# Exit maintenance mode
php artisan up

echo "🚀 Application deployed!"
