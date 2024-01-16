<<<<<<< HEAD
=======
#!/bin/sh
>>>>>>> dev
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php -r "unlink('composer.lock');"
rm composer.lock
rm package-lock.json

#cs fixer
php -d memory_limit=-1 composer.phar global require -W friendsofphp/php-cs-fixer
<<<<<<< HEAD
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
=======
#grumphp
php -d memory_limit=-1 composer.phar global require -W phpro/grumphp
#phpstan
>>>>>>> dev
php -d memory_limit=-1 composer.phar global require -W --dev larastan/larastan
php -d memory_limit=-1 composer.phar global require -W --dev phpstan/phpstan
