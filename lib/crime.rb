class Crime
	def initialize(crime)
		load_settings
		@crime = crime
	end

	def load_settings
		# Settings
		# Things such as default messages etc belong here
		@@awaiting_outcome_message = "Awaiting outcome"
	end

	def category
		# String in a hyphenated format
		# => anti-social-behaviour
		labelize(@crime['category'])
	end

	def labelize(string)
		# Because category field uses lower case hyphenated strings eg "anti-social-behaviour".
		# => Anti social behaviour
		string.gsub("-", " ").capitalize
	end

	def has_outcome_status?
		@crime['outcome_status'] != nil
	end

	def outcome_status_category
		# Either nil or an array depending on if there is an outcome for this crime.
		@crime['outcome_status']['category']
	end

	def outcome
		# Outcome of the crime
		# => Anti social behaviour
		# => Awaiting outcome (or whatever the default message is - see settings)
		if has_outcome_status?
			outcome_status_category
		else
			@@awaiting_outcome_message
		end
	end

	def street_name
		# We removed "on or near" from the data, no point repeating this in the view.
		@crime['location']['street']['name'].gsub("On or near", "")
	end

	def date
		# Raw data from the api.
		# => 2017-04
		@crime['month']
	end

	def month
		# Month of the crime as an integer.
		# => 11
		@crime['month'].split("-").last.to_i
	end

	def year
		# Year of the crime as an integer.
		# => 2017
		@crime['month'].split("-").first.to_i
	end

	def pretty_date
		# Date of the crime as a human readable string.
		# => May 2014
		"#{Date::MONTHNAMES[month]} #{year}"
	end

end