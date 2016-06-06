# app/controllers/records_controller.rb

class RecordsController < ApplicationController
	def index
		@records = Record.all 
	end

	def create
		@record = Record.new(record_params)

		if @record.save
			render json: @record
		else
			render json: @record.errors, status: :unprocessable_entity
		end
	end


	private


		def record_params
			param.require(:record).permit(:title, :amount, :date)
		end
end
