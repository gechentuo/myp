class ClasController < ApplicationController
  def create
   	@cla = Cla.new(params[:cla].permit(:name))
	@cla.grade = Grade.find(params[:gid])
	@clas = Grade.find(params[:gid]).clas
	@gid = params[:gid]
	
	if @cla.save
		respond_to do |format|
			format.js
		end
	else
		respond_to do |format|
			format.html{redirect_to adclas_school_path(current_user.school) }
		end
	end
  end

  def destroy
  end

  def update
  end
end
