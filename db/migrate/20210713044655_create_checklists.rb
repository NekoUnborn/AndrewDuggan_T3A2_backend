class CreateChecklists < ActiveRecord::Migration[6.1]
  def change
    create_table :checklists do |t|
      t.references :child, null: false
      t.time :time, null: false
      t.references :medication, null: false
      t.boolean :complete
      t.date :last_accessed

      t.timestamps
    end
  end
end
