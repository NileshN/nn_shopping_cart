class CartsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :user_cart

  def add_product_to_cart
    @cart = Cart.find_or_create_by_user_id(current_user.id)
    @product = Product.find(params[:id])
    if @cart.add(@product, @product.price)
    	@product.decrease_quantity
    	flash[:notice] = "Product added to cart successfully."
    end
    redirect_to root_path
  end

  def remove_product_from_cart
  	@product = Product.find(params[:id])
  	if @shopping_cart.remove(@product, 1) 
  		@product.increase_quantity
	  	flash[:notice] = "Item removed from cart successfully."
	  end
  	redirect_to carts_index_path
  end

  private

  def user_cart
  	@shopping_cart = current_user.cart
  end
end
