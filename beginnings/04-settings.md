## Settings

How application settings work is covered thoroughly in the [Sinatra Documentation](http://sinatrarb.com), but for the sake of completeness, I'll give an example for later reference.

    require 'padrino-core'
    require 'rack/test'
    
    class SettingsApp < Padrino::Application
      set :test, "Hello World"
      
      get "/setting" do
        settings.test
      end
    end
    
    def app
      SettingsApp
    end
    
    include Rack::Test::Methods
    
    get "/setting"
    last_response.body.assert == "Hello World"
