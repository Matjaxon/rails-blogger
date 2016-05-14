class TagsController < ApplicationController

  def index
    @tags = Tag.order('tags.name').all
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
