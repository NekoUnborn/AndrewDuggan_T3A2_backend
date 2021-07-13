class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.resources :child
      t.date :date
      t.boolean :complete

      t.timestamps
    end
  end
end
