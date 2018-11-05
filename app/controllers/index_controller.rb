require 'sinatra'


def setup_index_view
	birthdate = params[:birthdate]
	birth_path_number = Person.get_birth_path_num(birthdate)
	@message = Person.message(birth_path_number)
	erb :index
end

get '/' do
	erb :form 

end

post '/' do
	birthdate = params[:birthdate]#.gsub(/[-]/, '')
	if Person.valid_birthdate(birthdate)
		birth_path_number = Person.get_birth_path_num(birthdate)
		redirect "/message/#{birth_path_number}"
	else
		@error = "Oops! It looks like you didn't enter a valid birthdate. You should enter a valid birthdate in the form of mmddyyyy."

	end
end

get '/message/:birth_path_number' do
	birth_path_number = params[:birth_path_number].to_i
	@message = Person.message(birth_path_number)
	erb :index
end

get '/:birthdate' do
	setup_index_view
end

 

