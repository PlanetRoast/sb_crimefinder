class CrimeFinder

	def initialize(args={})
		require 'open-uri'
		settings
		@errors 	= []
		@crimes 	= []
		@lat 		= args[:lat]
		@lng 		= args[:lng]
		@url 		= "https://data.police.uk/api/crimes-street/all-crime?lat=#{@lat}&lng=#{@lng}"

		@request = make_the_request
		validate_the_request

		if valid?
			load_crimes
		end

	end

	def settings
		@error_message_404 = "The crimes database couldn't be reached at this time."
		@error_message_400 = "Something seemed to be wrong with your search, please try again."
	end

	def validate_the_request
		if @request.code == "404"
			@errors << @error_message_404
		elsif @request.code == "400"
			@errors << @error_message_400
		end
	end

	def valid?
		# True if there are no errors
		@errors.empty?
	end

	def load_crimes
		json_data.each do |i|
			@crimes << Crime.new(i)
		end
	end

	def crimes
		@crimes
	end

	def errors
		@errors
	end

	def make_the_request
		url = URI(@url)
		res = Net::HTTP.get_response(url)
		return res
	end

	private

	def json_data
		JSON.parse(open(@url).read)
	end

end
