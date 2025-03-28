class BookmarksController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]


  before_action :set_bookmark, only: %i[ show edit update destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end
    def bookmark_params
      params.require(:bookmark).permit(:name)
    end
end
