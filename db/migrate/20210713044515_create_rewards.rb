class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.references :child, null: false
      t.date :date, null: false
      t.boolean :complete, null: false

      t.timestamps
    end
  end
end
