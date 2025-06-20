class LogEntry < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  belongs_to :project, optional: true

  has_many :log_entry_tags, dependent: :destroy
  has_many :tags, through: :log_entry_tags

  accepts_nested_attributes_for :log_entry_tags, allow_destroy: true, reject_if: :all_blank

  validates :entry_date, presence: true
end
