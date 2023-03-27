FROM node:14-alpine
RUN apk update
RUN apk add git
RUN git --version
RUN git config --global url."https://${GIT_USER}:${GIT_PSW}@github.com/".insteadOf "https://github.com/"

RUN echo "git clone ${GIT_URL} /usr/appsrc  -b ${GIT_BRANCH}"
RUN git clone ${GIT_URL} /usr/appsrc -b ${GIT_BRANCH}
RUN echo "mv /usr/appsrc/nodesrvcbe/* /app" > /opt/app-root/etc/xmove.sh
RUN chmod 777 /opt/app-root/etc/xmove.sh


WORKDIR /app
RUN echo "---> Installing application source ..."
RUN /opt/app-root/etc/xmove.sh 

RUN apk add g++ make py3-pip && \
  npm install && \
  mkdir logs
COPY ./robot-ACC-OPEN/ .
CMD [ "npm", "start" ]
