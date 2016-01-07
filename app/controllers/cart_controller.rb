class CartController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def add 
		id = params[:id]
 	#if the cart has already been created, use the exisiting cart else create a new cart
 	if session[:cart] then 
 		cart = session[:cart]
 	else 
 		session[:cart] = {}
 		cart = session[:cart]
 	end 
 	# if the product has already been added to the cart, increment the value
 	if cart[id] then 
 		cart[id] = cart[id] + 1
 	else 
 		cart[id] = 1
 	end 
 	redirect_to :action => :index
 end 

 def clearCart
 	session[:cart] = nil 
 	redirect_to :action => :index
 end 

 def index 
	#if there is a cart, pass it to the page for display otherwise pass an empty value
	if session[:cart] then 
		@cart = session[:cart]
	else 
		@cart = {}
	end 
end 

private

def current_user_cart
	"cart#{current_user.id}"
	end
end
