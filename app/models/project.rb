class Project < ApplicationRecord
  has_many :log_entries, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
