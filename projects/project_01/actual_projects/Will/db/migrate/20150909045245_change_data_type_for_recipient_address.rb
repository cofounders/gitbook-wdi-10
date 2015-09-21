class ChangeDataTypeForRecipientAddress < ActiveRecord::Migration
  def change
  	change_column :letters, :recipient_address, :text
  end
end
