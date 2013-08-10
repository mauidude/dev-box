include_recipe "apt"
include_recipe "git"
include_recipe "curl"
include_recipe "build-essential"
include_recipe "vim"

include_recipe "development::rvm"
include_recipe "postgresql::server"
include_recipe "xvfb"
include_recipe "google-chrome"

include_recipe "elasticsearch"
include_recipe "qt"