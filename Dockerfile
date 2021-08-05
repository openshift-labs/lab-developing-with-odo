FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.1

RUN source /opt/workshop/etc/profile.d/python.sh && \
    pip install --no-cache-dir powerline-shell==0.7.0 && \
    fix-permissions /opt/app-root

ENV TERMINAL_TAB=split ODO_VERSION=latest

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/Dockerfile /tmp/src/.gitignore /tmp/src/.dockerignore /tmp/src/apb && \
    rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble
