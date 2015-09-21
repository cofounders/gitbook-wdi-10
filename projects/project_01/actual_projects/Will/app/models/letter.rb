# == Schema Information
#
# Table name: letters
#
#  id           :integer          not null, primary key
#  recipient    :text
#  email        :text
#  content      :text
#  deliver_date :date
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  image_url    :string           default("http://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
#

class Letter < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :moods

	validates :recipient, :presence => true
	validates :email, :presence => true
	validates :content, :presence => true
	validates :deliver_date, :presence => true
end
