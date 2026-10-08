@echo off
REM Christmas Together - one-time Android setup (run from this folder)
echo Installing packages...
call npm install || goto :err
echo Creating Android project...
call npx cap add android || goto :err
echo Generating icons and splash screens...
call npx capacitor-assets generate --android || goto :err
call npx cap sync android || goto :err
echo.
echo Done. Opening Android Studio...
call npx cap open android
goto :eof
:err
echo.
echo Setup stopped with an error. See the message above.
pause
