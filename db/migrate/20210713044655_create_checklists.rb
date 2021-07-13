class CreateChecklists < ActiveRecord::Migration[6.1]
  def change
    create_table :checklists do |t|
      t.resources :child
      t.time :time
      t.resources :medication
      t.boolean :complete
      t.date :last_accessed

      t.timestamps
    end
  end
end
