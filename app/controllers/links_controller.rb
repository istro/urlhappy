class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new

  end

  def create
    if params[:q] == ''
      redirect_to '/links/new'
    else
      link = Link.new(:original => params[:q])
      link.add
     redirect_to '/'
    end

  end

  def show
    redirect_to "#{Link.find(params[:id]).meowbify}"
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to '/'
  end

end
