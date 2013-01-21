# Beginnings

## A single-file Sinatra application

To start my story, I'll begin with a bare Sinatra application. Because Padrino emphasizes using the modern Sinatra style, lets we'll use the Sinatra base class. We use the `sinatra` gem and `rack/test`, to write a few tests later.

    require 'sinatra'
    require 'rack/test'
    require 'ae'

Lets continue by defining a hello world application.

    class ::HelloWorld < Sinatra::Application
      get '/' do
        "Hello World!"
      end
    end

This application can be run by calling `HelloWorld.run!`, but we will take a different route instead: we'll test it immediately.

    def app
      ::HelloWorld
    end
    
    include Rack::Test::Methods
    
    get "/"
    last_response.body.assert == "Hello World!"