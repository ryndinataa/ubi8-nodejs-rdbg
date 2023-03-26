@echo off
call ..\login.cmd
oc project %APP_PROJ%
pause

set fltempl=nodejs-s2i-srvc-templ.yaml
set fldepl=nodejs-s2i-srvc-depl.yaml 
oc delete -f %fldepl%
set APP_SERVICE_NAME=nodejs-s2i-srvc
set APP_NAME=nodejs-remote-debug
set GIT_BRANCH=tz-000001-init
set GIT_URL=https://github.com/pavlo-shcherbukha/ubi8-nodejs-rdbg.git
set DOCKER_PTH=/openshift/ubi8_docker_deployment/Dockerfile


oc process -f %fltempl%  --param=NAMESPACE=%APP_PROJ% --param=APP_SERVICE_NAME=%APP_SERVICE_NAME% --param=APP_NAME=%APP_NAME% --param=GIT_BRANCH=%GIT_BRANCH% --param=GIT_URL=%GIT_URL% --param=DOCKER_PTH=%DOCKER_PTH% -o yaml > %fldepl% 
oc create -f %fldepl%
pause

 