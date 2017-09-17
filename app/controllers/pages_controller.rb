class PagesController < ApplicationController

	#before_action :validate_params

	def index
		puts params.inspect
		if params.include?(:location)
			get_crimes
		end
	end

	private

	def get_crimes
		@crimefinder = CrimeFinder.new(lat: params[:latitude], lng: params[:longitude])

		if @crimefinder.valid?
			@crimes = @crimefinder.crimes
		else
			@errors = @crimefinder.errors
		end	
	end

	def validate_params
		@errors = "Error!"
	end


end

# country should be United Kingdom
# 