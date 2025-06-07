class LogEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_log_entry, only: [:edit, :update, :destroy]

  def index
    @log_entries = current_user.log_entries.includes(:tags).order(entry_date: :desc)
  end

  def new
    @log_entry = current_user.log_entries.new(user_id: current_user.id, entry_date: Time.zone.now)
    @tags = Tag.all
  end

  def create
    @log_entry = current_user.log_entries.new(log_entry_params)
    if @log_entry.save
      flash[:notice] = "Log entry created successfully."
      redirect_to(log_entries_path)
    else
      flash.now[:alert] = "Error creating log entry."
      @tags = Tag.all
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @tags = Tag.all
  end

  def update
    if @log_entry.update(log_entry_params)
      flash[:notice] = "Log entry updated successfully."
      redirect_to(log_entries_path)
    else
      flash.now[:alert] = "Error updating log entry."
      @tags = Tag.all
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    if @log_entry.destroy
      flash[:notice] = "Log entry deleted successfully."
      redirect_to(log_entries_path)
    else
      flash[:alert] = "Error deleting log entry."
    end
  end

  private

  def log_entry_params
    params.require(:log_entry).permit(
      :entry_date,
      :content,
      :project_id,
      :user_id,
      { log_entry_tags_attributes: }
    )
  end

  def log_entry_tags_attributes
    [
      :id,
      :_destroy,
      tag_attributes: [:id, :name, :_destroy]
    ]
  end

  def set_log_entry
    @log_entry = current_user.log_entries.find(params[:id])
  end
end