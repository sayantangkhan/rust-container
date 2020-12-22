FROM ubuntu:focal

ENV TZ=America/Detroit
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Updating packages and installing build tools
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y \
    sudo \
    build-essential \
    curl \
    git \
    openssh-client \
    zsh \
    tmux \
    pkgconf \
    software-properties-common \
    python-is-python3

# Installing Emacs 27
RUN add-apt-repository ppa:kelleyk/emacs && \
    apt-get update && \
    apt-get install -y emacs27-nox

# Creating a regular user
ARG user=rust-dev
RUN groupadd -g 1000 $user && \
    useradd -m -u 1000 -g 1000 $user && \
    chsh -s /usr/bin/zsh $user
WORKDIR /home/$user
USER $user

# Rust toolchain
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# Git config
ARG realname=Sayantan\ Khan
ARG realemail=sayantangkhan@gmail.com

RUN git config --global user.name "$realname" && \
    git config --global user.email "$realemail"

# Install Emacs Cask
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python 

# Adding zsh, emacs and tmux config files
ADD files /home/$user/files
USER root
RUN chown -R $user:$user /home/$user/files
USER $user

RUN rm .zshenv && \
    mv files/tmux.conf /home/$user/.tmux.conf && \
    mv files/zprezto /home/$user/.zprezto && \
    ln -sv /home/$user/.zprezto/runcoms/zlogin ~/.zlogin && \
    ln -sv /home/$user/.zprezto/runcoms/zlogout ~/.zlogout && \
    ln -sv /home/$user/.zprezto/runcoms/zpreztorc ~/.zpreztorc && \
    ln -sv /home/$user/.zprezto/runcoms/zprofile ~/.zprofile && \
    ln -sv /home/$user/.zprezto/runcoms/zshenv ~/.zshenv && \
    ln -sv /home/$user/.zprezto/runcoms/zshrc ~/.zshrc && \
    mv files/emacs-conf/* ~/.emacs.d/ && \
    cd ~/.emacs.d && \
    ~/.cask/bin/cask install

ENV TERM=screen-256color

ADD entrypoint-script.sh /tmp/entrypoint-script.sh

RUN mkdir /home/$user/project-directory
WORKDIR /home/$user/project-directory
ENTRYPOINT bash /tmp/entrypoint-script.sh
