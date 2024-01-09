#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

<<<<<<< HEAD
<<<<<<< HEAD
#cs fixer 
=======
#cs fixer
>>>>>>> 2bf991e (first)
=======
#cs fixer
>>>>>>> 5f13fe2 (first)
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 2bf991e (first)
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 5f13fe2 (first)
