class UserMailer < ApplicationMailer
	default from: 'william.tanzy@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'https://timecapsuleapp.herokuapp.com/'
		mail(to: @user.email, subject: "Welcome to Time Capsule")
	end

	def letter_email(user, letter)
		@user = user
		@letter = letter
		mail(to: @letter.email, subject: "You got an email from #{@user.name} from the past" )
	end
end
