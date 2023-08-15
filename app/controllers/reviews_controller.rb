class ReviewsController < ApplicationController
  before_action :authenticate_user!

	def index
		@reviews = current_user.reviews
	end

	def show
		@review = Review.find(params[:id])
	end

	def new
		@gkpt = GkptInformationForm.new(current_user)
	end

	def create
		@gkpt_information_form = GkptInformationForm.new(current_user, gkpt_information_form_params)
		if @gkpt_information_form.save
			flash[:success] = "GKPTが作成されました。"
			redirect_to reviews_path
		else
			render 'new'
		end
	end

	def destroy
    @review = Review.find(params[:id])
		@review.destroy
    flash[:success] = 'GKPTを削除しました'
    redirect_to reviews_url
	end

	private

	def review_params
		params.require(:review).permit(:topic)
	end

	def gkpt_information_form_params
		params.require(:gkpt_information_form).permit(:topic)
	end
end
