class TagsController < ApplicationController
  def index
    @target = params[:target]
    @tags = Tag.where("name ILIKE ?", "%#{params[:query]}%").limit(10).distinct

    respond_to(&:turbo_stream)
  end

  def show
    respond_to(&:turbo_stream)
  end

  def new
    @tag = Tag.new(name: params[:name])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag created successfully."
      respond_to(&:turbo_stream)
    else
      flash.now[:alert] = "Error creating tag."
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag updated successfully."
      respond_to(&:turbo_stream)
    else
      flash.now[:alert] = "Error updating tag."
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
