class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @log_entries = current_user.log_entries.includes(:tags).order(entry_date: :desc)
    @tags = Tag.all
    @log_entry = current_user.log_entries.new(user_id: current_user.id, entry_date: Date.current)
  end
end
