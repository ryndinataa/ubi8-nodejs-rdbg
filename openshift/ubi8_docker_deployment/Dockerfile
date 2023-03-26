FROM registry.access.redhat.com/ubi8/nodejs-14
USER 0

##COPY . /tmp/src
## RUN git config --global url."https://${git_personal_token}:@github.com/".insteadOf "https://github.com/"
RUN git config --global url."https://${GIT_USER}:${GIT_PSW}@github.com/".insteadOf "https://github.com/"
RUN echo "git clone ${GIT_URL} /tmp/src -b ${GIT_BRANCH}"
RUN git clone ${GIT_URL} /tmp/src -b ${GIT_BRANCH}


# RUN chown -R 1001:0 /tmp/src
RUN /usr/bin/fix-permissions /tmp/src
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble
##EXPOSE 8080

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
