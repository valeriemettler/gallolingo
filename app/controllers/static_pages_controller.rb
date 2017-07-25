class StaticPagesController < ApplicationController
    before_action :authenticate_user, except: [:landing]
    
    def landing
    end

    def dashboard
        if @current_user.favorite_course
            redirect_to course_path(@current_user.favorite_course)
        else
            redirect_to selection_path
        end
    end

    def selection
        @courses = Course.all
    end

    def choose
        @current_user.favorite_course = params[:course_id]
        @current_user.save(validate: false)
        redirect_to root_path 
    end
end
