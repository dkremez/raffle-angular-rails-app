class EntriesController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		render json: Entry.all
	end

	def show
		render json: Entry.find(params[:id])
	end

	def create
		render json: Entry.create(entry_params)
	end

	def update
		render json: Entry.update(params[:id], entry_params)
	end

	def destroy
		render json: Entry.destroy(params[:id])
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:id, :name, :winner)
    end

end
