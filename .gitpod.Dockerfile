FROM gitpod/workspace-base:latest

RUN sudo apt-get update \
    && sudo apt-get install -y gnupg software-properties-common curl git dirmngr gpg gawk \
    linux-headers-$(uname -r) build-essential procps file libreadline-dev zlib1g-dev \
    zsh \
    httpie \
    && sudo rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.8.1

RUN echo ". $HOME/.asdf/asdf.sh" >> $HOME/.bashrc.d/asdf.sh
RUN echo ". $HOME/.asdf/completions/asdf.bash" >> $HOME/.bashrc.d/asdf.sh

ENV BUMP_TO_FORCE_GITPOD_UPDATE=1
COPY gitpod/.tool-versions $HOME/
COPY gitpod/install-asdf-plugins.sh $HOME/
RUN ./install-asdf-plugins.sh
RUN bash -c ". $HOME/.bashrc.d/asdf.sh && asdf install"

# ZSH
ENV ZSH_THEME cloud
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


CMD [ "zsh" ]
