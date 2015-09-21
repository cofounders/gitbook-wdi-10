class MoodsController < ApplicationController
	before_action :check_if_admin, :only => [:index, :new, :create, :show, :edit, :update, :destroy]

	def index
		@moods = Mood.all
	end

	def new
		@mood = Mood.new
	end

	def create
		@mood = Mood.new mood_params
		if @mood.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@mood = Mood.find params[:id]
	end

	def edit
		@mood = Mood.find params[:id]
	end

	def update
		@mood = Mood.find params[:id]
		@mood.update mood_params
		
		if @mood.save
			redirect_to moods_path
		else
			render :edit
		end
	end

	def destroy
		mood = Mood.find params[:id]
		mood.destroy
		redirect_to moods_path
	end

	private
	def mood_params
		params.require(:mood).permit(:name)
	end

	def check_if_admin
		redirect_to root_path unless @current_user.present? && @current_user.admin?
	end
end
