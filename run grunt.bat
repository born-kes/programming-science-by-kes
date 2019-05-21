@ECHO OFF
@cd .grunt/

ECHO.
CHOICE /M "Grunta run and Karma"

ECHO.

IF ERRORLEVEL 2 GOTO No
IF ERRORLEVEL 1 GOTO Yes

:Yes
grunt goKarma

:No
grunt