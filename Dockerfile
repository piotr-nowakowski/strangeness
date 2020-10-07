FROM rootproject/root:6.20.08-ubuntu20.04

RUN apt-get update
RUN apt-get install -y python3-pip

RUN pip3 install --no-cache-dir notebook==5.*

ARG NB_USER=jupyter
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
    
COPY . ${HOME}
USER root

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

ENTRYPOINT ["/entrypoint.sh"]
