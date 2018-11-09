get '/people' do
	@people = Person.all.order(birthdate: :desc)
	@people_half = people_table_split(@people)
	@people1 = @people.limit(@people_half)
	@people2 = @people.offset(@people_half + 1)
	erb :"/people/index"
end

get '/people/new' do
	@person = Person.new
	@person.birthdate = Date.today
	erb :"/people/new"
end

post '/people' do
	if params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
	end

	person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
	redirect "/people/#{person.id}"
end

get '/people/:id/edit' do
	@person = Person.find(params[:id])
	erb :'/people/edit'
end

put '/people/:id' do
	person = Person.find(params[:id])
	person.first_name = params[:first_name]
	person.last_name = params[:last_name]
	person.birthdate = params[:birthdate]
	person.save
	redirect "/people/#{person.id}"
end

delete '/people/:id' do
	person = Person.find(params[:id])
	person.destroy
	redirect "/people"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	@birthdate = @person.birthdate
	birth_path_number = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
	@message = Person.message(birth_path_number)
	erb :"/people/show"
end


