@ECHO OFF
cls
GOTO newtest

:question01
CHOICE /m "Czy masz zainstalowanego nodejs ?"
IF ERRORLEVEL 2 GOTO NoNodejs
IF ERRORLEVEL 1 GOTO YesNodejs

GOTO koniec
:NoNodejs

cls
echo Jest potrzebny do testow
echo pobierz go z https://nodejs.org
echo.
start "" https://nodejs.org/en/

GOTO question01

:YesNodejs
SHIFT
echo "Czy chcesz sprawdzic czy nodejs & npm dziala?"
CHOICE /m "sprawdzic wersje?"

IF ERRORLEVEL 2 GOTO NoTestNodejs
IF ERRORLEVEL 1 GOTO TestNodejs

:TestNodejs
cls
Start ""cmd npm --version

:NoTestNodejs
SHIFT
CHOICE /m "Czy masz plik package.json"
IF ERRORLEVEL 2 GOTO NoPackage
IF ERRORLEVEL 1 GOTO HevePackage

:NoPackage
SHIFT
CHOICE /m "Czy chcesz go stworzyc?"

IF ERRORLEVEL 2 GOTO koniec
IF ERRORLEVEL 1 GOTO GeneratorPackage

:GeneratorPackage
Start ""cmd npm init
GOTO koniec

:HevePackage
echo Jestes gotowi do instalacji pakietow?
SHIFT
CHOICE /m "Czy zainstalowac z package.json ?" 

IF ERRORLEVEL 2 GOTO InstallGrunt
IF ERRORLEVEL 1 GOTO InstallGruntFromPackage

:info
SHIFT
cls
echo Grunt wykonuje liste taskow (zadania) napisanych w js.
echo Sledzi zmiany w plikach i reaguje na eventy, 
echo minifikuje kod, skleja pliki, podmienia tagi na tekst, powtarza testy, itd.
echo Jednym slowem wykonuje powtarzalne czynnosci w tle, albo po flagach.
echo W zaleznosci od potrzeb, mozna zainstalowac wybrane pakiety.
echo .
GOTO HevePackage

:InstallGrunt
SHIFT
cls
CHOICE /C tni /N /m "Czy zainstalowac Grunt? [T, N, Info]" 
IF ERRORLEVEL 3 GOTO info
IF ERRORLEVEL 2 GOTO NoInstallGrunt
IF ERRORLEVEL 1 GOTO goInstalGrunt

:goInstalGrunt
echo Instalacja grunta globalnie.
echo .
Start ""cmd npm install -g grunt-cli

echo zainstaluj grunt'a w projekcie z modulami 
Start ""cms npm install grunt --save-dev grunt-contrib-connect grunt-contrib-watch --save-dev

echo zainstaluj karm'e :supports test-driven development & modus
Start ""cms npm install karma grunt-karma karma-jasmine jasmine-core karma-browser-reporter karma-story-reporter --save-dev

echo instal launcher for browsers to test for karma
Start ""cms  npm install karma-chrome-launcher karma-cli karma-firefox-launcher karma-ie-launcher karma-phantomjs-launcher karma-script-launcher --save-dev

:InstallGruntFromPackage
Start ""cms npm install


:NoInstallGrunt
GOTO koniec
:newtest
:installGlobalGrunt

echo Instalacja grunta globalnie.
echo .
cd t
Start ""cmd npm install grunt --save-dev

echo instaluje grunt'a w projekcie z modulami 

GOTO koniec

:TODO
:: - Tworzymy pliki config
:: * gruntfile.js
:: * karma.config.js
::
::
:: -------------------------------------------
:: Grunt - wykonuje liste taskow (zadan) opisanych w js.
:: Glup (alternatywa)
:: -------------------------
:: front-end
:: https://bower.io/ sledzi pakiety ktore chcesz miec w projekcie i je aktualizuje, albo sciaga potrzebne wersje.
::
:: -------------------------
:: http://yeoman.io/ - Tworzy i rozbudowuje szkielet aplikacji - korzysta z gotowych generatorow ( mobilne, rozszenenia firefox'a i chroma, wordpress'a itp),
::				tworzy tez procedury dla Grunta i zestaw testow jednostkowych.
::  -------------------------
:: 
:: Composer
 
 :koniec