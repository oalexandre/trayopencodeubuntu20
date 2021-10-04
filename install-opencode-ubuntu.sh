VERSION='2.3.3'
sudo apt remove libssl-dev
sudo apt update && \
sudo apt install -y autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev rbenv;

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

wget 	http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0-dev_1.0.2n-1ubuntu5_amd64.deb
sudo dpkg -i libssl1.0-dev_1.0.2n-1ubuntu5_amd64.deb
 

mkdir -p "$(rbenv root)"/plugins && \
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build;

rbenv install $VERSION && \
rbenv global $VERSION;

gem install faraday -v 1.0.1 && \
gem install launchy -v 2.4.3 && \
gem install nokogiri -v 1.6.8 && \
gem install opencode_theme;
