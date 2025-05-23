class CreateLogEntries < ActiveRecord::Migration[8.0]
  create_table :log_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, foreign_key: true
      t.date :entry_date, null: false
      t.text :content, null: false

      t.timestamps
    end
end
