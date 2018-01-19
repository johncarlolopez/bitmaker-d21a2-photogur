class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]

  def index
    @most_recent_pictures = Picture.most_recent_five
    @older_than_month = Picture.created_before(Time.now - 1.month)
    @years = Picture.years
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    # unless @picture.valid?
    #   # ap @picture.errors.messages
    #   @picture.errors.messages.each {|key,value|
    #     puts "#{key.capitalize} #{value.first}"
    #   }
    # end
    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
      # redirect_to
    else
      # otherwise render new.html.erb
      render :new
    end
  end
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end
end
