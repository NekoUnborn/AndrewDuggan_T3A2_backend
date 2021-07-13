class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.resources :user
      t.string :name

      t.timestamps
    end
  end
end
