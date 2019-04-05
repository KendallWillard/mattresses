class App < Sinatra::Base
  use Rack::MethodOverride

  use BrandsController
end
