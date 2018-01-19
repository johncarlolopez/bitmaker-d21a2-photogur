class PicturesController < ApplicationController
  before_action :new_picure, only: [:new, :create]
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def index
    @most_recent_pictures = Picture.most_recent_five
    @older_than_month = Picture.created_before(Time.now - 1.month)
    @years = Picture.years
  end
  def show
    @user = @picture.user
  end
  def new
  end
  def create
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user = current_user
    # unless @picture.valid?
    #   # ap @picture.errors.messages
    #   @picture.errors.messages.each {|key,value|
    #     puts "#{key.capitalize} #{value.first}"
    #   }
    # end
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end
  def edit
  end

  def update
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to picture_path(@picture.id)
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_url
  end

  private

  def ensure_user_owns_picture
    unless current_user == @picture.user
      flash[:alert] = "You do not have rights to that picture"
      redirect_to picture_path(params[:id])
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def new_picure
    @picture = Picture.new
  end
end
