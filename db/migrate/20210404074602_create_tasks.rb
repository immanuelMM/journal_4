class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed
      t.datetime :completed_at
      t.references :category
      
      t.timestamps
    end
  end
end
