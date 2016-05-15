class TagsController < ApplicationController

  before_filter :require_login, only: [:destroy]

  def require_login
    unless logged_in?
      redirect_to root_path
      return false
    end
  end

  def index
    @tags = Tag.order('tags.name').all
  end

  def show
    @tag = Tag.find(params[:id])
  end



end
