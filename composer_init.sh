#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

php -d memory_limit=-1 composer.phar require filament/filament
php -d memory_limit=-1 composer.phar require coolsam/modules
php -d memory_limit=-1 composer.phar require nwidart/laravel-modules
php -d memory_limit=-1 composer.phar require doctrine/dbal
php -d memory_limit=-1 composer.phar require livewire/livewire
php -d memory_limit=-1 composer.phar require livewire/volt
### SPATIE
php -d memory_limit=-1 composer.phar require filament/spatie-laravel-tags-plugin
php -d memory_limit=-1 composer.phar require filament/spatie-laravel-media-library-plugin
php -d memory_limit=-1 composer.phar require filament/spatie-laravel-translatable-plugin
php -d memory_limit=-1 composer.phar require spatie/laravel-cookie-consent
php -d memory_limit=-1 composer.phar require spatie/laravel-data
php -d memory_limit=-1 composer.phar require spatie/laravel-event-sourcing
php -d memory_limit=-1 composer.phar require spatie/laravel-permission
php -d memory_limit=-1 composer.phar require spatie/laravel-queueable-action
php -d memory_limit=-1 composer.phar require spatie/laravel-model-status
php -d memory_limit=-1 composer.phar require spatie/laravel-model-states
php -d memory_limit=-1 composer.phar require spatie/laravel-query-builder
php -d memory_limit=-1 composer.phar require spatie/laravel-activitylog
php -d memory_limit=-1 composer.phar require spatie/laravel-schemaless-attributes
php -d memory_limit=-1 composer.phar require spatie/laravel-feed
### USER 
php -d memory_limit=-1 composer.phar require jenssegers/agent
php -d memory_limit=-1 composer.phar require laravel/passport
php -d memory_limit=-1 composer.phar require socialiteproviders/auth0
php -d memory_limit=-1 composer.phar require tightenco/parental
### NOTIFY
php -d memory_limit=-1 composer.phar require kreait/firebase-php
### MEDIA
php -d memory_limit=-1 composer.phar require pbmedia/laravel-ffmpeg
php -d memory_limit=-1 composer.phar require intervention/image
php -d memory_limit=-1 composer.phar require spatie/image
### PROFILE 
php -d memory_limit=-1 composer.phar require tightenco/parental
### UI
php -d memory_limit=-1 composer.phar require laravel/breeze
php -d memory_limit=-1 composer.phar require owenvoke/blade-fontawesome
## IMPORT/EXPORT
php -d memory_limit=-1 composer.phar require konnco/filament-import
php -d memory_limit=-1 composer.phar require spipu/html2pdf
php -d memory_limit=-1 composer.phar require maatwebsite/excel
####
php -d memory_limit=-1 composer.phar require thecodingmachine/safe
php -d memory_limit=-1 composer.phar require symfony/dom-crawler
php -d memory_limit=-1 composer.phar require flowframe/laravel-trend
php -d memory_limit=-1 composer.phar require staudenmeir/laravel-adjacency-list
php -d memory_limit=-1 composer.phar require fidum/laravel-eloquent-morph-to-one
php -d memory_limit=-1 composer.phar require calebporzio/sushi
php -d memory_limit=-1 composer.phar require laravel/slack-notification-channel
php -d memory_limit=-1 composer.phar require predis/predis

### DEV
php -d memory_limit=-1 composer.phar require --dev barryvdh/laravel-debugbar
php -d memory_limit=-1 composer.phar require --dev barryvdh/laravel-ide-helper
php -d memory_limit=-1 composer.phar require --dev thecodingmachine/phpstan-safe-rule
php -d memory_limit=-1 composer.phar require --dev larastan/larastan
php -d memory_limit=-1 composer.phar require --dev laravel/pint
php -d memory_limit=-1 composer.phar require --dev pestphp/pest
php -d memory_limit=-1 composer.phar require --dev pestphp/pest-plugin-laravel

### REMOVE
php -d memory_limit=-1 composer.phar remove laravel/sanctum
rm config/sanctum.php 

