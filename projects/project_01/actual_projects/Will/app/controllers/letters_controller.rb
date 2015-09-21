class LettersController < ApplicationController
	before_action :check_if_logged_in, :only => [:new, :create, :edit, :update, :destroy]
	before_action :check_if_admin, :only => [:edit, :update, :destroy]

	def index
		@letters = Letter.all
	end

	def mood
		@letters = Letter.all
		@mood = Mood.find_by :name => params[:mood].capitalize
		@letters = @letters.select { |letter|
			letter.mood_ids.include?(@mood.id)
		}
	end

	def show
		@letter = Letter.find params[:id]
	end

	def new
		@letter = Letter.new
	end

	def create
		@letter = Letter.new letter_params
		if @letter.save
			@letter.mood_ids = params[:letter][:mood_ids]
			if params[:file].present?
				response = Cloudinary::Uploader.upload params[:file]
				@letter.image_url = response["url"]
			else
				@letter.image_url = "http://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg"
			end
			@letter.user_id = @current_user.id
			@letter.save
			num_of_days_delayed = (@letter.deliver_date - Date.today).to_i
			num_of_days_delayed = 0 if num_of_days_delayed < 0
			UserMailer.letter_email(@current_user, @letter).deliver_later!(wait: num_of_days_delayed.minute)
			redirect_to @letter
		else
			render :new
		end
	end

	def edit
		@letter = Letter.find params[:id]
	end

	def update
		@letter = Letter.find params[:id]
		@letter.update letter_params
		if @letter.save
			@letter.mood_ids = params[:letter][:mood_ids]
			@letter.save
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		letter = Letter.find params[:id]
		letter.destroy
		redirect_to @current_user
	end

	private
	def letter_params
		params.require(:letter).permit(:recipient, :email, :content, :deliver_date, :mood_ids)
	end

	def check_if_logged_in
		redirect_to root_path unless @current_user.present?
	end

	def check_if_admin
		redirect_to root_path unless @current_user.present? && @current_user.admin?
	end
end
