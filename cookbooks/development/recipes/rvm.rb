# Set variables
app_name = 'development'
app_config = node[app_name]
app_user_config = node[app_name][:user]
app_ruby_config = node[app_name][:ruby]

# setup rvm for user
include_recipe "rvm::user"
rvm_default_ruby app_ruby_config do
  user  app_user_config
end

rvm_shell "install rails" do
  ruby_string app_ruby_config
  user        app_user_config
  group       app_user_config
  code        "gem install rails -v 4.0.0"
end

rvm_shell "install other required dependencies" do
  ruby_string app_ruby_config
  user        app_user_config
  group       app_user_config
  code        "gem install rake bundler"
end

rvm_shell "install zeus" do
  ruby_string app_ruby_config
  user        app_user_config
  group       app_user_config
  code        "gem install zeus -v 0.13.4.pre2"
end

env "ZEUSSOCK" do
  value "/tmp/zeus.sock"
end