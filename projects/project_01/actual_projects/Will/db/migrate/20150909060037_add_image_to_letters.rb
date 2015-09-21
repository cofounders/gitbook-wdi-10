class AddImageToLetters < ActiveRecord::Migration
  def change
  	add_column :letters, :image_url, :string, :default => 'http://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg'
  end
end
