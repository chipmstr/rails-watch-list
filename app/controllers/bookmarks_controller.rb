class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      # Redirect to the list show page to avoid resubmitting the form data
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      # Render the current list with the errors (keeps the user on the same page)
      flash.now[:alert] = @bookmark.errors.full_messages.join(", ")
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      redirect_to list_path(@list), notice: 'Bookmark was successfully updated.'
    else
      flash.now[:alert] = @bookmark.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    Rails.logger.debug "Deleting bookmark with ID: #{@bookmark.id}"

    if @bookmark.destroy
      redirect_to list_path(@bookmark.list), status: :see_other, notice: 'Bookmark was successfully deleted.'
    else
      Rails.logger.error "Failed to delete bookmark: #{@bookmark.errors.full_messages.join(', ')}"
      flash[:alert] = 'Error deleting bookmark.'
      redirect_to list_path(@bookmark.list)
    end
  end

  private

  def bookmark_params
    # Only permit movie_id now, comment is no longer needed
    params.require(:bookmark).permit(:movie_id)
  end
end
