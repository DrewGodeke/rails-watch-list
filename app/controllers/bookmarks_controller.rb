# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  before_action :set_list, only: [:create]

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Movie was successfully added to the list.'
    else
      # Handle validation errors
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully deleted from the list.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id)
  end
end
