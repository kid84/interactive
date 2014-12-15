require 'sinatra'

class App < Sinatra::Base
    register Sinatra::Reloader
    get '/' do
        haml:'haml/index'
    end
    get '/graph' do
        haml:'haml/graph'
    end
    
    get %r{^/(stylesheets|javascripts)/(.*)\.(css|js)$} do
      dir = params[:captures][0] == 'stylesheets' ? 'scss' : 'coffee'
      file = params[:captures][1]
      method = params[:captures][2] == 'css' ? :scss : :coffee
      send(method, :"#{ dir }/#{ file }")
    end
end
