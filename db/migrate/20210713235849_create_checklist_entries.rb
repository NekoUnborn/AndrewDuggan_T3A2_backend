class CreateChecklistEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :checklist_entries do |t|
      t.references :child, null: false, foreign_key: true
      t.time :time
      t.references :medicine, null: false, foreign_key: true
      t.boolean :complete
      t.date :last_accessed

      t.timestamps
    end
  end
end
