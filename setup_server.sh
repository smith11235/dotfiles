# ssh -i ~/smith-bw.pem ubuntu@smith.brickworksoftware.com

# Setup Github
  ssh-keygen -t rsa -C "smith11235@gmail.com"
  cat ~/.ssh/id_rsa.pub # add to github
  
  sudo apt-get install git -y
  git config --global user.name "smith11235"
  git config --global user.email smith11235@gmail.com
  ssh -T git@github.com
  exit

# Update base packages for Ruby & Gem build
  sudo apt-get update
  sudo apt-get upgrade -y
  export package_list='curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libgdbm-dev libncurses5-dev automake libtool bison libffi-dev mysql-client libmysqlclient-dev libmagickwand-dev imagemagick phantomjs libpq-dev rmagick'
  sudo apt-get install $package_list -y

# Login Perms
  sudo sed -i 's/PermitRootLogin\\swithout-password/PermitRootLogin no/' /etc/ssh/sshd_config
  sudo sed -i 's/UsePAM\\syes/UsePAM no/' /etc/ssh/sshd_config
  sudo service ssh restart

# Setup Redis
  # http://redis.io/topics/quickstart
  wget http://download.redis.io/redis-stable.tar.gz
  tar xvzf redis-stable.tar.gz
  pushd redis-stable
  make
  sudo make install
  nohup redis-server &> redis-server.log &
  popd 
  rm redis-stable.tar.gz

# Nginx Install
  sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
  sudo gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -
  sudo apt-get install apt-transport-https -y
  echo "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main' >> /etc/apt/sources.list.d/passenger.list" > .tmpsh
  sudo sh .tmpsh
  rm .tmpsh
  sudo chown root: /etc/apt/sources.list.d/passenger.list
  sudo chmod 600 /etc/apt/sources.list.d/passenger.list
  sudo apt-get update -y
  sudo apt-get install nginx-full passenger -y
  sudo service nginx start 

# Nginx Config
  sudo vim /etc/nginx/sites-enabled/default
"
  server{    
    listen 80; 
    server_name smith.brickworksoftware.com;    
    location / { 
      proxy_pass http://localhost:3000;      
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   Host      $http_host;    
    }   
  }
  server {    
    listen 80; 
    server_name mail.brickworksoftware.com;    
    location / { 
      proxy_pass http://localhost:1080;      
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   Host      $http_host;    
    }   
  }
"
  sudo service nginx restart
  sudo chown -R ubuntu:ubuntu /home/ubuntu/.gnupg 

# Install Dotfiles
  git clone git@github.com:smith11235/dotfiles.git
  pushd dotfiles
  ruby dotfiles.rb
  exit

# Get Brickwork
  git clone git@github.com:brickworksoftware/brickwork_app.git
  build_rvm
 

