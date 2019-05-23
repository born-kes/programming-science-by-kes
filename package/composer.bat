@ECHO OFF
cls
:: location composer.phar
SET COMPOSER=composer.phar
SET THIS_CATALOG=%~dp0

setlocal DISABLEDELAYEDEXPANSION
@php "%THIS_CATALOG%%COMPOSER%" %*
