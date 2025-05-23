class Tag < ApplicationRecord
  has_many :log_entry_tags, dependent: :destroy
  has_many :log_entries, through: :log_entry_tags

  validates :name, presence: true, uniqueness: true
end
