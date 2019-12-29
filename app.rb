require './environment'
require './app/models/pirate.rb'
require './app/models/ship.rb'

module FormsLab
  class App < Sinatra::Base
    get '/new' do 
      erb :"pirates/new" 
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      
      @ships = Ship.all

 
      erb :"pirates/show"
  end
end

end
