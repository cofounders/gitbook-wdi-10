# == Schema Information
#
# Table name: moods
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mood < ActiveRecord::Base
	has_and_belongs_to_many :letters

	validates :name, :presence => true
end
