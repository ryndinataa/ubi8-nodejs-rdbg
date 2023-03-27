@echo on
call ..\login.cmd
oc project %APP_PROJ%
pause

set fltempl=nodejs-s2i-route-temp.yaml
set fldepl=nodejs-s2i-route-depl.yaml
 

echo %APP_PROJ% .....

echo %APP_DNS%   .....

set APP_SERVICE_NAME=nodejs-s2i-srvc
set APP_NAME=nodejs-remote-debug
set ROUTENAME=nodes2i-srvc-%APP_PROJ%.%APP_DNS%
set SRVHOSTNAME=nodes2i-srvc-%APP_PROJ%.%APP_DNS%
set PORTNUMBER=8080


echo APP_SERVICE_NAME=%APP_SERVICE_NAME%
echo APP_NAME=%APP_NAME%
echo ROUTENAME=%ROUTENAME%
echo SRVHOSTNAME=%SRVHOSTNAME%
echo PORTNUMBER=%PORTNUMBER%


pause



oc delete -f %fldepl%

pause
oc process -f %fltempl%  --param=NAMESPACE=%APP_PROJ%  --param=APP_SERVICE_NAME=%APP_SERVICE_NAME% --param=APP_NAME=%APP_NAME% --param=ROUTENAME=%ROUTENAME% --param=HOSTNAME=%SRVHOSTNAME% --param=PORTNUMBER=%PORTNUMBER% -o yaml > %fldepl% 
pause
oc create -f %fldepl%
pause
 
     
     
     
