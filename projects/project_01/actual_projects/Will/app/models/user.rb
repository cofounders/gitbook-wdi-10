# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  name            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :letters

	validates :email, :presence => true, :uniqueness => true
	validates :name, :presence => true, :length => {:minimum => 3}
end
