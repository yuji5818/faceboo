lock '3.6.0'

# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}
