class TopicsController < ApplicationController

	before_action :set_topic, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category_id].present?
			@topics = Topic.where(category_id: params[:category_id])
		else
			@topics = Topic.all
		end
	end

	def show
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params)

		if @topic.save
			redirect_to @topic, notice: 'New Topic has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @topic.update(topic_params)
			redirect_to @topic, notice: 'Topic has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@topic.destroy
		redirect_to topics_path, notice: 'Topic has been deleted successfully.'
	end


	private
		def topic_params
			params.require(:topic).permit(:category_id, :topic_title, :topic_description)
		end

		def set_topic
			@topic = Topic.find(params[:id])
		end
end
