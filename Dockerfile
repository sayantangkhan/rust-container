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
    software-properties-common

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

# Adding zsh and tmux config files
ADD files /home/$user/files
RUN chown -R $user:$user /home/$user/files

USER $user

RUN mv files/tmux.conf ~/.tmux.conf && \
    mv files/zprezto ~/.zprezto && \
    ln -sv /home/$user/.zprezto/runcoms/zlogin ~/.zlogin && \
    ln -sv /home/$user/.zprezto/runcoms/zlogout ~/.zlogout && \
    ln -sv /home/$user/.zprezto/runcoms/zpreztorc ~/.zpreztorc && \
    ln -sv /home/$user/.zprezto/runcoms/zprofile ~/.zprofile && \
    ln -sv /home/$user/.zprezto/runcoms/zshenv ~/.zshenv && \
    ln -sv /home/$user/.zprezto/runcoms/zshrc ~/.zshrc

ENV TERM=screen-256color

# Rust toolchain
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# Git config
ARG realname=Sayantan\ Khan
ARG realemail=sayantangkhan@gmail.com

RUN git config --global user.name "$realname" && \
    git config --global user.email "$realemail"

