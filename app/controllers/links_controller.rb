class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @link = Link.find_by_short(params[:id])

    @link.count_clicks

    redirect_to @link.meowbified_url
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to '/'
  end

end
