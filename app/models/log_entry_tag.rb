class LogEntryTag < ApplicationRecord
  belongs_to :log_entry
  belongs_to :tag
end
