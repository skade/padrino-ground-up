## Padrino

Fancy. Now what about Padrino? Using a simplistic view, Padrino consists of a set of Sinatra extensions. To see which ones, lets start by defining a Padrino application. First, require Padrino and define a new class like we did before.

    require 'padrino-core'
    require 'rack/test'
	
    class HelloPadrino < Padrino::Application

    end

You can check all registered extensions that use Sinatras extension protocol properly by calling `#extensions`.

    HelloPadrino.extensions.assert == [Padrino::Routing]

That not a lot, isn't it? The only thing that Padrino::Application adds _by default_ is a enhanced routing system together with some fancy helpers to use it. Lets have a look at what it can do.

    class HelloPadrino < Padrino::Application
      controller :hello do
        get :hello do
          "Hello, you can find me at " + url_for(:hello, :hello)
        end
      end
    end
    
    def app
      HelloPadrino
    end
    
    include Rack::Test::Methods
    
    get HelloPadrino.url_for(:hello, :hello)
    last_response.status.assert == 200
    last_response.body.assert == "Hello, you can find me at " + HelloPadrino.url_for(:hello, :hello)
    
Never seen this? Well, Padrino has the habit of seperating all usages of the controller-DSL into different files, so usually, you would see this written as:

    HelloPadrino.controller :hello do
      get :hello => "/hello" do
        "Hello, you can find me at " + url_for(:hello, :hello)
      end
    end

For the details of the routing DSL, have a look at the [Padrino Guides](http://padrinorb.com/guides).