# global
default[:development][:user] = "vagrant"
default[:development][:ruby] = "2.0.0"
default[:development][:workspace] = "/home/#{default[:development][:user]}/workspace"

default[:postgresql][:password][:postgres] = "password"


default[:rvm][:user_installs] = [
  {
  :user          => default[:development][:user],
  :rubies        => [default[:development][:ruby]]
  }
]
default[:rvm][:user_global_gems] = [
  {:name => "bundler"},
  {:name => "rake"},
]
default[:rvm][:version] = "1.19.6"
default[:rvm][:branch] = "none"
default[:rvm][:installer_url] = "https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer"
default[:rvm][:rvm_gem_options] = "--no-rdoc --no-ri"

default[:java][:jdk_version] = "7"
default[:java][:install_flavor] = "oracle"
default[:java][:oracle][:accept_oracle_download_terms] = true

default[:elasticsearch][:cluster_name] = "elasticsearch_test_chef"
default[:elasticsearch]['bootstrap.mlockall'] = false