FROM ubuntu:latest

# install core packages and create admin user
RUN apt update \
	&& apt install -y software-properties-common \
	&& add-apt-repository ppa:jonathonf/vim \
	&& apt update \
	&& apt install -y sudo curl zsh git vim tmux nodejs

# create admin user and set the default shell as zsh
RUN useradd -m admin \
	&& echo "admin:admin" | chpasswd \
	&& adduser admin sudo \
	&& chsh -s /bin/zsh
	# && chsh -s /bin/zsh admin

ENV SHELL /bin/zsh
USER admin
WORKDIR /home/admin

# RUN echo $0

# setup development environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git \
	&& cp ~/dotfiles/.zshrc ~ \
	&& cp ~/dotfiles/.vimrc ~ \
	&& cp ~/dotfiles/.tmux.conf ~ \
	&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& vim +PlugInstall +qall
	# && /bin/zsh -c "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh || true"
	# && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
 
ENV LANG en_US.UTF-8
CMD /bin/zsh
