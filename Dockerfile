FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.1

RUN source /opt/workshop/etc/profile.d/python.sh && \
    pip install --no-cache-dir powerline-shell==0.7.0 && \
    fix-permissions /opt/app-root

ENV TERMINAL_TAB=split ODO_VERSION=v1.1.0

RUN git clone https://github.com/openshift-labs/beercan-shooter-game.git sample && \
    fix-permissions /opt/app-root/src

RUN git clone https://github.com/openshift-roadshow/nationalparks-js backend && \
    git clone https://github.com/openshift-roadshow/parksmap-web frontend && \
    (cd frontend && mvn package && mvn clean) && \
    fix-permissions /opt/app-root/src

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/Dockerfile /tmp/src/.gitignore /tmp/src/.dockerignore /tmp/src/apb && \
    rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble
