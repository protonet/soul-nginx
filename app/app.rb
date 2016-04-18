require 'sinatra'

set :bind, '0.0.0.0'

get '*' do

  response.headers['X-Archive-Files'] = 'zip'

  "532908a0 908191 /files/nginx-1.9.14.tar.gz    nginx-1.9.14.tar.gz\n" +
  "- 26140 /files/mod_zip-9f68cba9.tar.gz mod_zip-9f68cba9.tar.gz\n"

end
