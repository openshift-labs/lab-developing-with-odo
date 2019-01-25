FROM quay.io/openshiftlabs/workshop-dashboard:1.3.3

RUN source /opt/workshop/etc/profile.d/python.sh && \
    pip install --no-cache-dir powerline-shell==0.7.0 && \
    fix-permissions /opt/app-root

ENV TERMINAL_TAB=split

RUN git clone https://github.com/openshift-labs/beercan-shooter-game.git sample && \
    fix-permissions /opt/app-root/src
COPY .workshop/assets/nodejs_assemble sample/.s2i/bin/assemble

RUN git clone https://github.com/grahamdumpleton/nationalparks-js backend && \
    git clone https://github.com/grahamdumpleton/parksmap-web frontend && \
    (cd frontend && mvn package && mvn clean) && \
    mkdir -p backend/.s2i/bin && \
    fix-permissions /opt/app-root/src
COPY .workshop/assets/nodejs_assemble backend/.s2i/bin/assemble

USER root

COPY . /opt/app-root/src

RUN rm Dockerfile .gitignore .dockerignore && \
    chown -R 1001:0 /opt/app-root/src && \
    fix-permissions /opt/app-root/src && \
    mv workshop /opt/app-root/workshop

USER 1001

ENV ODO_VERSION=0.0.17
