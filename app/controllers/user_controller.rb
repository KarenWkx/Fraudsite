class UserController < ApplicationController
	before_action :authenticate_user!

  # GET /icos

	def adminpage
		@rsearch = Ico.all
		if params[:search]
          @rsearch = Ico.search(params[:search])
        else 
          @rsearch = Ico.search(params[:search])
        end
	end

	def pending 
		@websites = Ico.distinct.pluck(:website)
		@ico = Ico.all
	end
	

	def approved
		@ico = Ico.all
	end

	def create_new 
	end

	def review
		@icos = Ico.all
		@result = Ico.find(params[:id])
		@delete = Ico.find(params[:id])
	end

	def destroy
		@icos.destroy
	end

	

end
