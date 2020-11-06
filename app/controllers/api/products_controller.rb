class Api::ProductsController < ApplicationController

  before_action :authenticate_user, except: [:show]

  def create
    cloudinary_url = nil
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
    end
    @product = Product.new(
      title: params[:title],
      price: params[:price],
      price_negotiable: params[:price_negotiable],
      category_id: params[:category_id],
      description: params[:description],
      image_url: cloudinary_url,
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
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
      @product.image_url = cloudinary_url|| @product.image_url
    end
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
