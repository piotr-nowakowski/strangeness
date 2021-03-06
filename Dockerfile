FROM rootproject/root:6.22.02-ubuntu20.04

RUN apt-get update
RUN apt-get install -y python2
RUN apt-get install -y python3 python3-pip

#RUN pip3 install --no-cache-dir notebook==5.*
RUN pip3 install --no-cache-dir jupyter
RUN pip3 install --no-cache-dir metakernel

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
    
USER root
COPY . ${HOME}
RUN rm ${HOME}/entrypoint.sh
RUN rm ${HOME}/Dockerfile
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

ENTRYPOINT ["/entrypoint.sh"]
