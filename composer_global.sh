#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

<<<<<<< HEAD
#cs fixer 
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#cs fixer
=======
#cs fixer 
>>>>>>> a176205 (first)
=======
#cs fixer
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
=======
#cs fixer
>>>>>>> dev
=======
#cs fixer 
>>>>>>> a176205 (first)
=======
#cs fixer
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
>>>>>>> c219998 (first)
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
=======
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 1283aaa (first)
=======
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> dd31420 (first)
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
=======
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
>>>>>>> a176205 (first)
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
>>>>>>> dev
=======
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
>>>>>>> a176205 (first)
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
>>>>>>> 5c07603 (Update composer dependencies and add larastan/larastan)
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> c219998 (first)
