FROM ubuntu:latest

# install core packages and create admin user
RUN apt update \
	&& apt install -y software-properties-common \
	&& add-apt-repository ppa:jonathonf/vim \
	&& apt update \
	&& apt install -y sudo curl zsh git vim tmux nodejs

# create admin user and set the default shell as zsh
RUN useradd -m admin \
	&& adduser admin sudo \
	&& echo "admin:admin" | chpasswd

USER admin
WORKDIR /home/admin

# setup development environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git \
	&& cp ~/dotfiles/.zshrc ~ \
	&& cp ~/dotfiles/.vimrc ~ \
	&& cp ~/dotfiles/.tmux.conf ~ \
	&& mkdir -p ~/.zsh && curl -L git.io/antigen > ~/.zsh/antigen.zsh \
	&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& vim +PlugInstall +qall
 
ENV LANG en_US.UTF-8
CMD /bin/zsh
