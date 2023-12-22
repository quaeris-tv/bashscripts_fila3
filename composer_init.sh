#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

################# REMOVE ##################
php -d memory_limit=-1 composer.phar remove -W --ignore-platform-reqs laravel/sanctum


############## priority 1 ####################
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs filament/filament:"^3.1"
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs coolsam/modules
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs konnco/filament-import
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs thecodingmachine/safe
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs laravel/passport
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs socialiteproviders/auth0
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs jenssegers/agent
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs owenvoke/blade-fontawesome
php artisan icons:cache

############### SPATIE #######################
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-cookie-consent
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-permission
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-queueable-action
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-data
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-tags
php -d memory_limit=-1 composer.phar require -W --ignore-platform-reqs spatie/laravel-event-sourcing


########### dev #######################
php -d memory_limit=-1 composer.phar require -W --dev --ignore-platform-reqs thecodingmachine/phpstan-safe-rule
php -d memory_limit=-1 composer.phar require -W --dev --ignore-platform-reqs barryvdh/laravel-debugbar
php -d memory_limit=-1 composer.phar require -W --dev --ignore-platform-reqs barryvdh/laravel-ide-helper
php -d memory_limit=-1 composer.phar require -W --dev --ignore-platform-reqs larastan/larastan
php -d memory_limit=-1 composer.phar require -W --dev --ignore-platform-reqs orchestra/testbench


