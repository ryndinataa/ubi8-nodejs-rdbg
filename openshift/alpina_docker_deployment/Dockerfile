FROM node:14-alpine
RUN apk update
RUN apk add git
RUN git --version
RUN git config --global url."https://${GIT_USER}:${GIT_PSW}@github.com/".insteadOf "https://github.com/"

RUN echo "git clone ${GIT_URL} /usr/appsrc  -b ${GIT_BRANCH}"
RUN git clone ${GIT_URL} /usr/appsrc -b ${GIT_BRANCH}
RUN echo "mv /usr/appsrc/nodesrvcbe/* /app" > /etc/xmove.sh
RUN chmod 777 /etc/xmove.sh

RUN ls
WORKDIR /app
RUN echo "---> Installing application source ..."
RUN /etc/xmove.sh 
RUN pwd
RUN ls
RUN apk add g++ make py3-pip && \
  npm install && \
  mkdir logs
CMD apprun.sh

