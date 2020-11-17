class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:index, :show, :create]

  def index
    @users = User.all
    render "index.json.jb"
  end
  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      company: params[:company],
      image_url: params[:image_url],
      bio: params[:bio],
      address: params[:address],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      website: params[:website],
      phone_number: params[:phone_number]
    )
    if @user.save #happy
      render "show.json.jb", status: :created
    else #sad
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
  def update
    @user = current_user
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.company = params[:company] || @user.company
    @user.address = params[:address] || @user.address
    @user.bio = params[:bio] || @user.bio
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.website = params[:website] || @user.website
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
      @user.image_url = cloudinary_url|| @user.image_url
    end
    @user.email = params[:email] || @user.email
    if params[:password]
      @user.password = params[:password] || @user.password
    end
    if @user.save #happy
      render "show.json.jb"
    else #sad
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def destroy
    user = current_user
    user.destroy
    render json: {message: "User destroyed"}
  end
end
