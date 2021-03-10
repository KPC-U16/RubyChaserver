FROM ubntu:latest
# rails向け


RUN apt -y update
RUN apt -y upgrade

RUN apt install -y  git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN ~/.rbenv/bin/rbenv init
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN source ~/.bashrc

RUN mkdir -p "$(rbenv root)"/plugins
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

RUN rbenv install 3.0.0
RUN rbenv global 3.0.0

RUN gem install rails
RUN rails -v 

RUN pwd