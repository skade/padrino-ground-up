## A complete application

To end this chapter, I will build and the subapplication structure Padrino uses for a small application. Every subapplication resides in its own folder, in a file called `app.rb`. You can find this application [TODO: Here](TODO).

    require 'padrino-core'
    require 'batcave/app'
    require 'batcave/controllers'
    require 'batcave/helpers'
    
    require 'rack/test'
    
    def app
      Batcave
    end
    
    include Rack::Test::Methods
    
    get "/vehicles"
    last_response.body.assert == "batmobilebatwing"
    get "/weapons/batarang"
    last_response.body.assert == "zoumzoumzoumouch"
    
    