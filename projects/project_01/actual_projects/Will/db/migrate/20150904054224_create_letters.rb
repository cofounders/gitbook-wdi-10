class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
    	t.text :recipient
    	t.text :recipient_address
    	t.text :content
    	t.date :deliver_date
    	t.integer :user_id
    	t.timestamps
    end
  end
end
