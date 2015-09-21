class CreateLettersMoods < ActiveRecord::Migration
  def change
    create_table :letters_moods, :id => false do |t|
      t.integer :letter_id
      t.integer :mood_id
    end
  end
end
