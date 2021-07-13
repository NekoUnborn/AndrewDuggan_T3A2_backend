class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :user, null: false
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
