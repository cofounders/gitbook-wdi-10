class ChangeLetters < ActiveRecord::Migration
  def change
  	change_table :letters do |t|
	  t.rename :recipient_address, :email
	end
  end
end
