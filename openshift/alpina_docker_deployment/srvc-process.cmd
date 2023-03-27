@echo off
call ..\login.cmd
oc project %APP_PROJ%
pause

set fltempl=nodejs-alpinadocker-srvc-templ.yaml
set fldepl=nodejs-alpinadocker-srvc-depl.yaml 
oc delete -f %fldepl%
set APP_SERVICE_NAME=nodejs-alpinadocker-srvc
set APP_NAME=nodejs-remote-debug
set GIT_BRANCH=tz-000001-init
set GIT_URL=https://github.com/pavlo-shcherbukha/ubi8-nodejs-rdbg.git
set DOCKER_PTH=./openshift/alpina_docker_deployment/Dockerfile

oc delete -f %fldepl%
pause
oc process -f %fltempl%  --param=NAMESPACE=%APP_PROJ% --param=APP_SERVICE_NAME=%APP_SERVICE_NAME% --param=APP_NAME=%APP_NAME% --param=GIT_BRANCH=%GIT_BRANCH% --param=GIT_URL=%GIT_URL% --param=DOCKER_PTH=%DOCKER_PTH% -o yaml > %fldepl% 
pause
oc create -f %fldepl%
pause

 