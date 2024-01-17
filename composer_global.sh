#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

#cs fixer 
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
<<<<<<< HEAD
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
=======
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
=======
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 1283aaa (first)
<<<<<<< HEAD
>>>>>>> 9146629 (rebase 2)
=======
=======
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> dd31420 (first)
>>>>>>> e58576c (rebase 5)
