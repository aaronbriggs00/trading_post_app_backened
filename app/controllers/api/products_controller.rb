class Api::ProductsController < ApplicationController

  before_action :authenticate_user, except: [:show]

  def create
    @product = Product.new(
      title: params[:title],
      price: params[:price],
      price_negotiable: params[:price_negotiable],
      category_id: params[:category_id],
      description: params[:description],
      image_url: params[:image_url],
      user_id: current_user.id,
      per_unit_pricing: params[:per_unit_pricing],
      unit: params[:unit]
    )
    if @product.save #happy
      render "show.json.jb", status: :created
    else #sad
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end
  def show
    @product = Product.find(params[:id])
    render "show.json.jb"
  end
  def update
    @product = Product.find(params[:id])
    @product.title = params[:title] || @product.title
    @product.price = params[:price] || @product.price
    @product.price_negotiable = params[:price_negotiable] || @product.price_negotiable
    @product.category_id = params[:category_id] || @product.category_id
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    @product.per_unit_pricing = params[:per_unit_pricing] || @product.per_unit_pricing
    @product.unit = params[:unit] || @product.unit
    if @product.save #happy
      render "show.json.jb"
    else #sad
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end
  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "product destroyed"}
  end
end
