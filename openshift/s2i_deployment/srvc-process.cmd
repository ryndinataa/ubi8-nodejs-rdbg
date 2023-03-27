@echo off
call ..\login.cmd
oc project %APP_PROJ%
pause

set fltempl=nodejs-s2i-srvc-templ.yaml
set fldepl=nodejs-s2i-srvc-depl.yaml 
oc delete -f %fldepl%
set APP_SERVICE_NAME=nodejs-s2i-srvc
set APP_NAME=nodejs-remote-debug
set FROM_IS_NAME=nodejs:14-ubi8


oc process -f %fltempl%  --param=NAMESPACE=%APP_PROJ% --param=APP_SERVICE_NAME=%APP_SERVICE_NAME% --param=APP_NAME=%APP_NAME%  --param=FROM_IS_NAME=%FROM_IS_NAME% -o yaml > %fldepl% 
oc create -f %fldepl%
pause

 