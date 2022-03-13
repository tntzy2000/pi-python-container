FROM condaforge/mambaforge:latest AS linuxBase
RUN sed -i 's:^path-exclude=/usr/share/man:#path-exclude=/usr/share/man:' \
        /etc/dpkg/dpkg.cfg.d/excludes \
    && export TZ=Asia/Tokyo \
# RUN export TZ=Asia/Tokyo \
    # && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    # && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tzdata \
    && rm -rf /var/lib/apt/lists/* 
ENV username=henrydev
ENV homedir=/home/${username}
RUN groupadd -r ${username} && useradd --no-log-init -r -m -d ${homedir} -g ${username} ${username}

FROM linuxBase AS linuxDev
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ## system tools
    # man \
    # tzdata \
    # manpages-posix \
    # info \
    less \
    # quota \
    # finger \
    # dos2unix \
    # locate \
    # tree \
    # tmux \
    ## process related
    # procps \
    # psmisc \
    ## editer
    vim \
    # nano \
    # emacs \
    ## network tools
    # dnsutils \
    # wget \
    # httping \
    # iproute2 \
    # net-tools \
    # inetutils-ping \
    # inetutils-traceroute \
    # iputils-tracepath \
    # openssh-client \
    # tcpdump \
    # ipv6calc \
    # openbsd-inetd \
    # kmod \
    # ifupdown2 \
    ## programming language
    # gcc \
    # mit-scheme \
    ## shell
    # tcsh \
    ## others
    # sysvbanner \
    # locales \
    # make \
    # flex \
    # graphviz \
    # rsync \
    # git \
    # ca-certificates \
    ## package tools
    # apt-file \
    # dlocate \
    ## administration
    # udev \
    ## logger
    # inetutils-syslogd \
    ## to get the man page
    # && apt-get install -y --reinstall \
    # bash \
    # grep \
    # dash \
    # apt \
    # util-linux \
    && export PAGER=less \
    # && apt-file update \
    && rm -rf /var/lib/apt/lists/* 

# FROM linuxBase AS mambaBase
# # RUN mkdir $
# # WORKDIR /code
# # COPY requirements.base.yml /code/
# # RUN mamba update -n base mamba \ 
# #     && mamba env create -f requirements.base.yml \
# #     && mamba clean -ay
# WORKDIR ${homedir}
# COPY requirements.jupyter.yml ${homedir}
# RUN mamba env create -f requirements.base.yml \
#     && mamba clean -ay


# FROM linuxDev AS mambaDev
# RUN mkdir /code
# WORKDIR /code
# COPY requirements.dev.yml /code/
# RUN mamba update -n base mamba \ 
#     && mamba env create -f requirements.dev.yml \
#     && mamba clean -ay

FROM linuxDev AS mambaDevJupyter
# RUN mkdir ${homedir}
WORKDIR ${homedir}
COPY requirements.jupyter.yml ${homedir}
RUN mamba env create -f requirements.jupyter.yml \
    && mamba clean -ay

WORKDIR ${homedir}
COPY .jupyter ${homedir}
COPY start-jupyterlab.sh ${homedir}
# CMD ["/bin/bash", "/home/henrydev/start-jupyterlab.sh", "8891"]