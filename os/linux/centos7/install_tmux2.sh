# remove old pkgs
sudo yum remove -y libevent libevent-devel libevent-headers

# install ncurses
sudo yum install -y ncurses-devel

# download libevent src
cd /usr/local/src
sudo curl -L https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz -o libevent-2.0.21-stable.tar.gz
sudo tar xvzf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
sudo ./configure && sudo make
sudo make install
sudo ln -s /usr/local/lib/libevent-2.0.so.5 /usr/lib64/libevent-2.0.so.5

cd /usr/local/src
sudo curl -L https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz -o tmux-2.3.tar.gz
sudo tar -xvzf tmux-2.3.tar.gz
cd tmux-2.3
sudo ./configure && sudo make
sudo make install
