class GradesController < ApplicationController
	def create
		grade = Grade.new(params[:grade].permit(:name))
		grade.school = current_user.school
		if grade.save
			@grades = current_user.school.grades
			@cla = grade.clas.new
	  		respond_to do |format|
				format.js
			end
		else
			respond_to do |format|
				format.html{redirect_to adclas_school_path(current_user.school) }
			end
		end

			
	end
end
