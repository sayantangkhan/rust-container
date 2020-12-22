# Remote Rust and Emacs
A container for Rust development on a minimal terminal Emacs.

# Usage
You can pull this image from Docker Hub using `docker pull sayantankhan/rust-container` or the equivalent `podman`
command. The following command binds the local \<project-directory\> folder to the container's working folder.

  docker run -v \<project-directory\>:/home/rust-dev/project-directory --rm -ti \<container-id\> tmux

You may need to change the UID of the process based on the permissions of your project directory and your own UID.
To run this container with podman, you need to run it with the `--privileged` flag to enable write access on the notebook directory.
