class HomeController < ApplicationController
	def index
		@arquivos = Arquivo.all
	end

	def new
		Arquivo.create(:file => params[:Filedata])
		render :nothing => true
	end
end
