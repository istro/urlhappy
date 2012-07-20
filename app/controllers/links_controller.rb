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
      link.verify
      link.meowbify
      link.save
      link.shorten
      link.save
      redirect_to '/links/'
    end

  end

  def destroy
  end
end
