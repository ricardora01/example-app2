#!/bin/bash
# Copy custom config to available sites
cp /home/site/wwwroot/default /etc/nginx/sites-available/default
# Ensure it's enabled (remove old symlink if exists, create new)
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
# Test config and restart Nginx fully (reload might not apply all changes)
nginx -t && service nginx restart
# Optional: Run Laravel optimizations if needed
cd /home/site/wwwroot
php artisan config:cache
php artisan route:cache
php artisan view:cache
