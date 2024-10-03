class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])  # find the list to edit
  end

  def update
    @list = List.find(params[:id])  # find the list to update

    # check if the checkbox to remove the photo is checked
    if params[:list][:remove_photo] == '1'
      @list.photo.purge  # remove the photo
    end

    # update and save the list
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'List was successfully updated.'
    else
      render :edit  # re-render the edit form in case of errors
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
