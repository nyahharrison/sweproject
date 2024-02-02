# app/controllers/bookmarks_controller.rb

class BookmarksController < ApplicationController
    before_action :authenticate_user!
  
    def create
      current_user.bookmarks.create(recipe_id: params[:id])
      redirect_to root_path, notice: 'Recipe bookmarked successfully.'
    end
  
    def destroy
      bookmark = current_user.bookmarks.find_by(recipe_id: params[:id])
      bookmark.destroy if bookmark
      redirect_to root_path, notice: 'Recipe removed from bookmarks.'
    end
  end
  