class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    # @movie = Movie.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render:new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render:new
    end
  end

  def destroy
    @list = Movie.find(params[:id])
    @list.delete
    redirect_to lists_path
  end

private

  def list_params
    params.require(:list).permit(:name, :movies)
  end
end
