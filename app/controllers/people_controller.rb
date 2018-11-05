get '/people' do
	@people = Person.all
	erb :"/people/index"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	@birthdate = Person.format_birthdate(@person.birthdate)
	birth_path_number = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
	@message = Person.message(birth_path_number)
	erb :"/people/show"
end
