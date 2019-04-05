class BrandsController < Sinatra::Base
set :views, (Proc.new { File.join(root, "../views") })

  # **********  READ *********************
  get '/brands' do
    @brands = Brand.all
    erb :'brands/index'
  end

  # ********** CREATE ********************
  get '/brands/new' do
    erb :'brands/new'
  end


  get '/brands/:id' do
    @brand = Brand.find(params[:id])
    erb :'brands/show'
  end



  get '/brands/:id/edit' do
    @brand = Brand.find(params[:id])
    erb :'brands/edit'
  end

  post '/brands' do
    Brand.create(params)
    redirect '/brands'
  end

  put '/brands/:id' do
    brand = Brand.find(params[:id])
    brand.update(
      name: params[:name]
    )
    redirect '/brands'
  end

  delete '/brands/:id' do
    brand = Brand.find(params[:id])
    brand.destroy

    redirect '/brands'
  end

end
