class ProductsController < ApplicationController
  respond_to :json

  def index
  	@@data = File.read("#{Rails.root}/app/assets/javascripts/products.json")
  	respond_with @@data
  end

  def show
  	@product = params[:id]
  	@@data = File.read("#{Rails.root}/app/assets/javascripts/#{@product}.json")
  	respond_with @@data
  end
end
