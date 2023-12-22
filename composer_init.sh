#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

################# REMOVE ##################
php -d memory_limit=-1 composer.phar remove -W  laravel/sanctum


############## priority 1 ####################
php -d memory_limit=-1 composer.phar require -W  filament/filament:"^3.1"
php -d memory_limit=-1 composer.phar require -W  coolsam/modules
php -d memory_limit=-1 composer.phar require -W  konnco/filament-import
php -d memory_limit=-1 composer.phar require -W  thecodingmachine/safe
php -d memory_limit=-1 composer.phar require -W  laravel/passport
php -d memory_limit=-1 composer.phar require -W  socialiteproviders/auth0
php -d memory_limit=-1 composer.phar require -W  jenssegers/agent
php -d memory_limit=-1 composer.phar require -W  owenvoke/blade-fontawesome
php artisan icons:cache

############### SPATIE #######################
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-cookie-consent
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-permission
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-queueable-action
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-data
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-tags
php -d memory_limit=-1 composer.phar require -W  spatie/laravel-event-sourcing


########### dev #######################
php -d memory_limit=-1 composer.phar require -W --dev  thecodingmachine/phpstan-safe-rule
php -d memory_limit=-1 composer.phar require -W --dev  barryvdh/laravel-debugbar
php -d memory_limit=-1 composer.phar require -W --dev  barryvdh/laravel-ide-helper
php -d memory_limit=-1 composer.phar require -W --dev  larastan/larastan
php -d memory_limit=-1 composer.phar require -W --dev  orchestra/testbench


