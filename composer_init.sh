#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

php -d memory_limit=-1 composer.phar require -W filament/filament
php -d memory_limit=-1 composer.phar require -W coolsam/modules
php -d memory_limit=-1 composer.phar require -W nwidart/laravel-modules
php -d memory_limit=-1 composer.phar require -W doctrine/dbal
php -d memory_limit=-1 composer.phar require -W livewire/livewire
php -d memory_limit=-1 composer.phar require -W livewire/volt
### SPATIE
php -d memory_limit=-1 composer.phar require -W filament/spatie-laravel-tags-plugin
php -d memory_limit=-1 composer.phar require -W filament/spatie-laravel-media-library-plugin
php -d memory_limit=-1 composer.phar require -W filament/spatie-laravel-translatable-plugin
php -d memory_limit=-1 composer.phar require -W spatie/laravel-cookie-consent
php -d memory_limit=-1 composer.phar require -W spatie/laravel-data
php -d memory_limit=-1 composer.phar require -W spatie/laravel-event-sourcing
php -d memory_limit=-1 composer.phar require -W spatie/laravel-permission
php -d memory_limit=-1 composer.phar require -W spatie/laravel-queueable-action
php -d memory_limit=-1 composer.phar require -W spatie/laravel-model-status
php -d memory_limit=-1 composer.phar require -W spatie/laravel-model-states
php -d memory_limit=-1 composer.phar require -W spatie/laravel-query-builder
php -d memory_limit=-1 composer.phar require -W spatie/laravel-activitylog
php -d memory_limit=-1 composer.phar require -W spatie/laravel-schemaless-attributes
php -d memory_limit=-1 composer.phar require -W spatie/laravel-feed
### USER 
php -d memory_limit=-1 composer.phar require -W jenssegers/agent
php -d memory_limit=-1 composer.phar require -W laravel/passport
php -d memory_limit=-1 composer.phar require -W socialiteproviders/auth0
php -d memory_limit=-1 composer.phar require -W tightenco/parental
### NOTIFY
php -d memory_limit=-1 composer.phar require -W kreait/firebase-php
### MEDIA
php -d memory_limit=-1 composer.phar require -W pbmedia/laravel-ffmpeg
php -d memory_limit=-1 composer.phar require -W intervention/image
php -d memory_limit=-1 composer.phar require -W spatie/image
### PROFILE 
php -d memory_limit=-1 composer.phar require -W tightenco/parental
### UI
php -d memory_limit=-1 composer.phar require -W laravel/breeze
php -d memory_limit=-1 composer.phar require -W owenvoke/blade-fontawesome
php -d memory_limit=-1 composer.phar require -W laravel/folio
php artisan folio:install
php -d memory_limit=-1 composer.phar require -W livewire/volt
php artisan volt:install
php -d memory_limit=-1 composer.phar require -W guava/filament-icon-picker
## IMPORT/EXPORT
php -d memory_limit=-1 composer.phar require -W konnco/filament-import
php -d memory_limit=-1 composer.phar require -W spipu/html2pdf
php -d memory_limit=-1 composer.phar require -W maatwebsite/excel
####
php -d memory_limit=-1 composer.phar require -W thecodingmachine/safe
php -d memory_limit=-1 composer.phar require -W symfony/dom-crawler
php -d memory_limit=-1 composer.phar require -W flowframe/laravel-trend
php -d memory_limit=-1 composer.phar require -W staudenmeir/laravel-adjacency-list
php -d memory_limit=-1 composer.phar require -W fidum/laravel-eloquent-morph-to-one
php -d memory_limit=-1 composer.phar require -W calebporzio/sushi
php -d memory_limit=-1 composer.phar require -W laravel/slack-notification-channel
php -d memory_limit=-1 composer.phar require -W predis/predis

### DEV
php -d memory_limit=-1 composer.phar require -W --dev barryvdh/laravel-debugbar
php -d memory_limit=-1 composer.phar require -W --dev barryvdh/laravel-ide-helper
php -d memory_limit=-1 composer.phar require -W --dev thecodingmachine/phpstan-safe-rule
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar require -W --dev laravel/pint
php -d memory_limit=-1 composer.phar require -W --dev pestphp/pest
php -d memory_limit=-1 composer.phar require -W --dev pestphp/pest-plugin-laravel

### REMOVE
php -d memory_limit=-1 composer.phar remove laravel/sanctum
rm config/sanctum.php 

