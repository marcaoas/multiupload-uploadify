class HomeController < ApplicationController
	def index
		@arquivos = Arquivo.all
	end

	def new
		arquivo = Arquivo.create(:file => params[:Filedata])
		render :text => arquivo.id
	end
end
