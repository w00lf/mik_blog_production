require 'rvm/capistrano' # Для работы rvm
require 'bundler/capistrano'
# -*- encoding : utf-8 -*-
# _your_login_ - Поменять на ваш логин в панели управления
# _your_project_ - Поменять на имя вашего проекта
# _your_server_ - Поменять на имя вашего сервера (Указано на вкладке "FTP и SSH" вашей панели управления)
# set :repository - Установить расположение вашего репозитория
# У вас должна быть настроена авторизация ssh по сертификатам

set :application, "blog"
set :scm, :git # Используем git. Можно, конечно, использовать что-нибудь другое - svn, например, но общая рекомендация для всех кто не использует git - используйте git. 
set :repository,  "https://github.com/w00lf/mik_blog_production.git" # Путь до вашего репозитария. Кстати, забор кода с него происходит уже не от вас, а от сервера, поэтому стоит создать пару rsa ключей на сервере и добавить их в deployment keys в настройках репозитария.
set :scm_username, "w00lf"
set :branch, "master" # Ветка из которой будем тянуть код для деплоя.
set :deploy_via, :remote_cache # Указание на то, что стоит хранить кеш репозитария локально и с каждым деплоем лишь подтягивать произведенные изменения. Очень актуально для больших и тяжелых репозитариев.
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`i

set :user, "hosting_w00lf"
set :use_sudo, false
dpath = "/home/#{user}/projects/blog"
set :deploy_to, dpath

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system
set :bundle_gemfile,      "Gemfile"
set :bundle_dir,          "#{shared_path}/gems"
set :bundle_flags,        "--deployment --quiet"
set :bundle_without,      [:development, :test]

role :web, "titanium.locum.ru"                          # Your HTTP server, Apache/etc
role :app, "titanium.locum.ru"                          # This may be the same as your `Web` server
role :db,  "titanium.locum.ru", :primary => true # This is where Rails migrations will run

before 'deploy:assets:update_asset_mtimes', :copy_private_info

task :copy_private_info, roles => :app do
  run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  run "ln -s #{shared_path}/private_info.yml #{release_path}/config/private_info.yml"
#  run "ln -s #{shared_path}/ckeditor_assets #{release_path}/public/assets/ckeditor_assets"
end

after 'deploy:create_symlink', :unicorm_pid_fix

task :unicorm_pid_fix, roles => :app do
  #run "rm #{release_path}/tmp/pids"
end

set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/#{application}.#{scm_username}.rb"
set :unicorn_pid, "/var/run/unicorn/#{application}.#{scm_username}.pid"
# old entry; set :unicorn_start, "rvm use 1.9.3 do bundle exec #{unicorn_rails} -Dc #{unicorn_conf}"
set :unicorn_start, "cd /home/hosting_w00lf/projects/blog/current && /usr/local/rvm/bin/rvm use 1.9.3 do bundle exec unicorn_rails -Dc #{unicorn_conf}"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{unicorn_start}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}` || #{unicorn_start}"
  end
end
