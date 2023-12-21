<<<<<<< HEAD
<<<<<<< HEAD
=======
#!/bin/sh
>>>>>>> 1283aaa (first)
=======
#!/bin/sh
>>>>>>> dd31420 (first)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

<<<<<<< HEAD
<<<<<<< HEAD
#cs fixer
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
=======
=======
>>>>>>> dd31420 (first)
#cs fixer 
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
php -d memory_limit=-1 composer.phar global require -W --dev nunomaduro/larastan
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 1283aaa (first)
=======
>>>>>>> dd31420 (first)
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
=======
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
>>>>>>> 98810cd (rebase 1/3)
