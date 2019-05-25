@ECHO OFF

cd package
phpunit
ECHO .
ECHO .
Echo %~dp0
Echo "%~dp0composer.phar" %*