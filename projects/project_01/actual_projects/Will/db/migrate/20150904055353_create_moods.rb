class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.text :name	
      t.timestamps null: false
    end
  end
end
