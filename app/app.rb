require 'sinatra'

set :bind, '0.0.0.0'

get '*' do
  response.headers['X-Archive-Files'] = 'zip'
  "- 908191 /files/nginx-1.9.14.tar.gz   nginx.tar.gz\n"
end