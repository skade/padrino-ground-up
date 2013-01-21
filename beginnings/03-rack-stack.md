## Stacking Racks

Sinatra - and by extension - Padrino are based on [Rack](http://rack.rubyforge.org). Padrino has multiple places where the Rack stack can be edited and extended, each of which I will introduce once all the components surrounding it are introduced. The first stack in Padrino is the App stack. Padrino applications can have multiple subapps, each of which is an instance of `Padrino::Application`. Each subapp can have its own Rack Middleware in front of it. This stack is managed using `Sinatra::Application#use`. Lets see how that works by adding basic auth to our application.

    require 'padrino-core'
    require 'rack/test'
    
    class Batcave < Padrino::Application
      
      use Rack::Auth::Basic, "SecuredApp" do |username, password|
        username == "batman" && password == "blackknight"
      end
      
    end

As before, you could also do this externally:

    Batcave.use Rack::Auth::Basic, "SecuredApp" do |username, password|
      username == "batman" && password = "blackknight"
    end

Now, our application is (somewhat) secure.

    def app
      Batcave
    end

    include Rack::Test::Methods
    
    get "/"
    last_response.status.assert == 401
    basic_authorize "batman", "blackknight"
    get "/"
    last_response.status.assert == 404
