FROM ubuntu:22.04
# https://github.com/willhallonline/docker-ansible/blob/master/ansible-core/ubuntu2204/Dockerfile
ARG ANSIBLE_CORE_VERSION
ARG ANSIBLE_VERSION
ARG ANSIBLE_LINT
ENV ANSIBLE_CORE_VERSION ${ANSIBLE_CORE_VERSION}
ENV ANSIBLE_VERSION ${ANSIBLE_VERSION}
ENV ANSIBLE_LINT ${ANSIBLE_LINT}

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 python3-pip sshpass git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN python3 -m pip install --upgrade pip cffi && \
    [ -z "$ANSIBLE_CORE_VERSION" ] && pip3 install ansible-core || pip3 install ansible-core==$ANSIBLE_CORE_VERSION && \
    [ -z "$ANSIBLE_VERSION" ] && pip3 install ansible || pip3 install ansible==$ANSIBLE_VERSION && \
    [ -z "$ANSIBLE_LINT" ] && pip3 install ansible-lint || pip3 install ansible-lint==$ANSIBLE_LINT && \
    pip3 install mitogen jmespath && \
    pip install --upgrade pywinrm && \
    rm -rf /root/.cache/pip

RUN mkdir ~/playbooks && \
    mkdir -p /etc/ansible

ENV LC_ALL C.UTF-8

# Install oh-my-zsh(optional)
RUN apt-get update && apt-get install -y zsh git curl\
    && chsh -s $(which zsh) \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="fox"/g' /root/.zshrc
CMD [ "zsh" ]