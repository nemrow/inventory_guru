module ApplicationHelper
	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def current_company
		Company.find(session[:company_id]) if session[:company_id]
	end

	def url_matches(content)
		request.url.match(/#{content}/)
	end

	def day_to_num(day)
		case day
			when 'sunday' then 1
			when 'monday' then 2
			when 'tuesday' then 3
			when 'wednesday' then 4
			when 'thursday' then 5
			when 'friday' then 6
			when 'saturday' then 0
		end
	end

	def num_to_day(day)
		case day
			when 1 then 'sunday'
			when 2 then 'monday'
			when 3 then 'tuesday'
			when 4 then 'wednesday'
			when 5 then 'thursday'
			when 6 then 'friday'
			when 0 then 'saturday'
		end
	end

	def date_format(date)
		if date.class == Time
			return date.strftime("%Y-%m-%d")
		elsif date.class == String
			return Time.parse(date).strftime("%Y-%m-%d")
		elsif date.class == Date
			return date.to_time.strftime("%Y-%m-%d")
		end
	end

	def simple_date(date)
		date.strftime("%m/%d")
	end
end
