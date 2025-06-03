class LogEntryTag < ApplicationRecord
  belongs_to :log_entry
  belongs_to :tag

  accepts_nested_attributes_for :tag, allow_destroy: true, reject_if: :all_blank
end
