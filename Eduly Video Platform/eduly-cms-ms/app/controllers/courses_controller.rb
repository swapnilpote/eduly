class CoursesController < ApplicationController

	before_action :set_course, only: [:show, :edit, :update, :destroy]

	def index
		if params[:topic_id].present?
			@courses = Course.where(topic_id: params[:topic_id])
		else
			@courses = Course.all
		end
	end

	def show
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)

		if @course.save
			redirect_to @course, notice: 'New Course has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @course.update(course_params)
			redirect_to @course, notice: 'Course has been updated successfully.'
		else
			render 'new'
		end
	end

	def destroy
		@course.destroy
		redirect_to courses_path, notice: 'Course has been deleted successfully.'
	end


	private
		def course_params
			params.require(:course).permit(:topic_id, :course_title, :course_description)
		end

		def set_course
			@course = Course.find(params[:id])
		end
end
