require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order')
also_reload('./models/*')

# index root - all the pizzas.
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# create new pizza
get '/pizza-orders/new' do
  erb(:new)
end

# show one pizza order (not all)
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create - make a pizza order
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# delete pizza
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect '/pizza-orders'
end

# edit order
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# update order
post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect '/pizza-orders'
end
