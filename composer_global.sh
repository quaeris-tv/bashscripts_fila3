<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#!/bin/sh
=======
>>>>>>> 409c33a (.)
=======
#!/bin/sh
>>>>>>> b320580 (first)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#cs fixer 
=======
<<<<<<< HEAD
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
<<<<<<< HEAD
>>>>>>> c219998 (first)
=======
=======
#cs fixer
>>>>>>> b3a67b2 (first)
>>>>>>> eee2a47 (.)
=======
#cs fixer
>>>>>>> b3a67b2 (first)
=======
#cs fixer
>>>>>>> 409c33a (.)
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
<<<<<<< HEAD
#phpstan
<<<<<<< HEAD
<<<<<<< HEAD
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
<<<<<<< HEAD
>>>>>>> e58576c (rebase 5)
=======
=======
<<<<<<< HEAD
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
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
>>>>>>> b3a67b2 (first)
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> c219998 (first)
<<<<<<< HEAD
>>>>>>> 0809004 (rebase 7)
=======
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> b3a67b2 (first)
>>>>>>> 568344a (rebase 9)
=======
>>>>>>> 8f35797 (up)
=======
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 409c33a (.)
=======
#cs fixer
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> b320580 (first)
