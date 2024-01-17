<<<<<<< HEAD
=======
#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

############## priority 1 ####################
php -d memory_limit=-1 composer.phar require -W thecodingmachine/safe
php -d memory_limit=-1 composer.phar require -W filament/filament
php -d memory_limit=-1 composer.phar require -W nwidart/laravel-modules
php -d memory_limit=-1 composer.phar require -W savannabits/filament-modules:dev-main
php -d memory_limit=-1 composer.phar require -W calebporzio/sushi
#non lo usiamo
#php -d memory_limit=-1 composer.phar require -W staudenmeir/eloquent-has-many-deep
#gia' presente in filament
#php -d memory_limit=-1 composer.phar require -W spatie/laravel-livewire-wizard
php -d memory_limit=-1 composer.phar require -W cknow/laravel-money

################ LARAVEL ########################

# per il login c'e' gia' filament
#php -d memory_limit=-1 composer.phar require -W  laravel/ui
#per gestire api
php -d memory_limit=-1 composer.phar require -W laravel/passport
#doctrine mi serve per le funzioni in piu' e per le migrazioni
php -d memory_limit=-1 composer.phar require -W doctrine/dbal
#scout per la ricerca, forse da sostituire con query builder di spatie
#php -d memory_limit=-1 composer.phar require -W  laravel/scout
# per avere gli errori in slack, non lo utilizziamo da un po
#php -d memory_limit=-1 composer.phar require -W  laravel/slack-notification-channel
# per fare login da facebook, google etc
php -d memory_limit=-1 composer.phar require -W laravel/socialite
# per le chiamate curl
php -d memory_limit=-1 composer.phar require -W guzzlehttp/guzzle

############  SPATIE ######################

<<<<<<< HEAD
#per gestire cookie
php -d memory_limit=-1 composer.phar require -W spatie/laravel-cookie-consent
#php -d memory_limit=-1 composer.phar require -W spatie/laravel-dashboard
#php -d memory_limit=-1 composer.phar require -W spatie/laravel-dashboard-time-weather-tile
php -d memory_limit=-1 composer.phar require -W spatie/laravel-permission
php -d memory_limit=-1 composer.phar require -W spatie/laravel-queueable-action
php -d memory_limit=-1 composer.phar require -W spatie/laravel-sitemap
php -d memory_limit=-1 composer.phar require -W spatie/laravel-sluggable
php -d memory_limit=-1 composer.phar require -W spatie/laravel-data
php -d memory_limit=-1 composer.phar require -W spatie/laravel-database-mail-templates
#modelservice andra sostituito con modelinfo
php -d memory_limit=-1 composer.phar require -W spatie/laravel-model-info
#i filtri su rows
php -d memory_limit=-1 composer.phar require -W spatie/laravel-query-builder
#status evoluti
php -d memory_limit=-1 composer.phar require -W spatie/laravel-model-states
#per gestire le immagini
php -d memory_limit=-1 composer.phar require -W spatie/laravel-medialibrary
#per gestire i tags
php -d memory_limit=-1 composer.phar require -W spatie/laravel-tags
#per gestire gli status
php -d memory_limit=-1 composer.phar require -W spatie/laravel-model-status
#da problemi con pest
#php -d memory_limit=-1 composer.phar require -W spatie/once
php -d memory_limit=-1 composer.phar require -W spatie/eloquent-sortable
php -d memory_limit=-1 composer.phar require -W spatie/laravel-translatable

########### OTHERS ########################

# per gestire i form filament
#php -d memory_limit=-1 composer.phar require -W  laravelcollective/html
# per le traduzioni altro pacchetto
#php -d memory_limit=-1 composer.phar require -W  mcamara/laravel-localization
# moduli gia' messo
#php -d memory_limit=-1 composer.phar require -W  nwidart/laravel-modules
# relazioni con profondita > 2 non uasto
#php -d memory_limit=-1 composer.phar require -W  staudenmeir/eloquent-has-many-deep
# per selezionare immagini nei form usiamo raplh
#php -d memory_limit=-1 composer.phar require -W  unisharp/laravel-filemanager
# per i js filament
#php -d memory_limit=-1 composer.phar require -W  livewire/livewire
# per le monete
#php -d memory_limit=-1 composer.phar require -W  cknow/laravel-money
# per le immagini
php -d memory_limit=-1 composer.phar require -W intervention/image
# per immagini e fa anche un percorso che gestisce le immagini in dimensione
php -d memory_limit=-1 composer.phar require -W intervention/imagecache
# per accellerare le risposte
php -d memory_limit=-1 composer.phar require -W genealabs/laravel-model-caching
# per gestire i campi status , ora usiamo spatie
# php -d memory_limit=-1 composer.phar require -W  asantibanez/laravel-eloquent-state-machines
# per selezionare dei tag html
php -d memory_limit=-1 composer.phar require -W symfony/dom-crawler
#per gestire modello home, themes confs
#php -d memory_limit=-1 composer.phar require -W calebporzio/sushi
#per gestire i tags
#php -d memory_limit=-1 composer.phar require -W spatie/laravel-tags
php -d memory_limit=-1 composer.phar require -W filament/spatie-laravel-tags-plugin
#per gestire parent_id, tree kalnoy troppo troppo pesante usiamo materialize
#php -d memory_limit=-1 composer.phar require -W  kalnoy/nestedset
#per gestire gli slug, da vedere se funziona meglio questo o quello di spatie
#php -d memory_limit=-1 composer.phar require -W cviebrock/eloquent-sluggable
php -d memory_limit=-1 composer.phar require -W fidum/laravel-eloquent-morph-to-one
#https://github.com/mhmiton/laravel-modules-livewire
php -d memory_limit=-1 composer.phar require -W mhmiton/laravel-modules-livewire
#gestire FFMPEG
php -d memory_limit=-1 composer.phar require -W pbmedia/laravel-ffmpeg

#php -d memory_limit=-1 composer.phar require yajra/laravel-datatables-oracle
#php -d memory_limit=-1 composer.phar require yajra/laravel-datatables

##splade prima si controlla la stabilita
# php -d memory_limit=-1 composer.phar require protonemedia/laravel-splade

############################ DEV ###############################
#regole per save library
php -d memory_limit=-1 composer.phar require -W --dev thecodingmachine/phpstan-safe-rule
#debugbar
php -d memory_limit=-1 composer.phar require -W --dev barryvdh/laravel-debugbar
#creazione automatica delle intestazione delle funzioni
php -d memory_limit=-1 composer.phar require -W --dev barryvdh/laravel-ide-helper
#test sul codice
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
=======
php -d memory_limit=-1 composer.phar require -W --dev nunomaduro/larastan
>>>>>>> 1283aaa (first)
=======
php -d memory_limit=-1 composer.phar require -W --dev nunomaduro/larastan
>>>>>>> dd31420 (first)
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
=======
php -d memory_limit=-1 composer.phar require -W --dev nunomaduro/larastan
>>>>>>> a176205 (first)
=======
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
=======
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
>>>>>>> dev
=======
php -d memory_limit=-1 composer.phar require -W --dev nunomaduro/larastan
>>>>>>> a176205 (first)
=======
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
<<<<<<< HEAD
>>>>>>> c219998 (first)
=======
=======
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
>>>>>>> b3a67b2 (first)
>>>>>>> eee2a47 (.)
=======
php -d memory_limit=-1 composer.phar require -W --dev larastan/larastan
>>>>>>> b3a67b2 (first)
#test su codice su moduli
php -d memory_limit=-1 composer.phar require -W --dev orchestra/testbench
#scrive la docs dei modelli e facades
php -d memory_limit=-1 composer.phar require --dev barryvdh/laravel-ide-helper

############################ GLOBAL ###############################

#cs fixer
php -d memory_limit=-1 composer.phar global require friendsofphp/php-cs-fixer
#laravel installer
php -d memory_limit=-1 composer.phar global require laravel/installer
>>>>>>> 9146629 (rebase 2)
=======
>>>>>>> 8f35797 (up)
