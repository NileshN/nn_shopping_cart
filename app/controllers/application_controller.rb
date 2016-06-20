class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :featured_products

  def after_sign_in_path_for(resource)
    root_path
  end

  def featured_products
  	@featured_products = Product.all(:limit => 4)
  end

end
